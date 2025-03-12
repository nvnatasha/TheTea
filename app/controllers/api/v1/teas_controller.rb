class Api::v1::TeasController < ApplicationController

    def index
        teas = Tea.all
        render json: TeaSerializer.format_teas(teas)
    end

    def show
        tea = Tea.find(params[:id])

        render json: TeaSerializer.format_tea(tea)
    end

    private

    params.require(:tea).permit(:name, :description, :temp, :brew_time)
end