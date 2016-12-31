class CouponsController < ActionController::Base

  def index
    @coupons = Coupon.all
  end

  def create
      @coupon = Coupon.new
       @coupon[:coupon_code] = params[:coupon_code]
       @coupon[:store] = params[:store]
       @coupon.save
       ###why does this block pass, but the block beneath doesn't.
       ###@coupon = Coupon.create(store: params[:coupon][:store], coupon_code: params[:coupon][:coupon_code])
       ###binding.pry here and @coupon is successfully instantiated but the rspec test doesnt pass.
       ###.create is supposed to combine .new and .save. the params were also correctly specified.
       redirect_to coupon_path(@coupon)
  end

  def new
    @coupon = Coupon.new
  end

  def show
    @coupon = Coupon.find(params[:id])
  end

end
