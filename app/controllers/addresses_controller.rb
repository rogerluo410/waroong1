class AddressesController < ApplicationController
  add_breadcrumb '地址管理', :addresses_path

  def index
    @addresses = current_user.addresses.where("is_delete is false")
  end

  def show
    redirect_to addresses_path and return
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
      redirect_to addresses_path and return
    else
      flash[:error] = @address.errors.full_messages.join('<br />')
      redirect_to new_address_path and return
    end
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      flash[:notice] = '更新地址成功'
      redirect_to addresses_path and return
    else
      flash[:error] = @address.errors.full_messages.join('<br />')
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.update(is_delete: true)
    @addresses = current_user.addresses.where("is_delete is false")
  end

  private

  def address_params
    params.require(:address).permit(:name, :cellphone, :address, :post)
  end
end