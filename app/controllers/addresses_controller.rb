class AddressesController < ApplicationController
  add_breadcrumb '地址管理', :addresses_path

  def index
    @addresses = current_user.addresses.where("is_delete is false")
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    add_breadcrumb '新增地址'
    @address = Address.new
  end

  def edit
    add_breadcrumb '编辑地址'
    @address = Address.find(params[:id])
  end

  def create
    @address = current_user.addresses.create(address_params)
    if @address.persisted?
      flash[:notice] = '创建地址成功'
      redirect_to addresses_path
    else
      flash.now[:error] = '创建地址失败, 请重试'
      render :new
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)

    if @address.persisted?
      flash[:notice] = '更新地址成功'
      redirect_to addresses_path
    else
      flash.now[:error] = '更新地址失败, 请重试'
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.update(is_delete: true)
  end

  private

  def address_params
    params.require(:address).permit(:name, :cellphone, :address, :post)
  end
end