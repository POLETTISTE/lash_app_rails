class DashboardController < ApplicationController
    def index
        @clients = Client.all
        @prestations = Prestation.all
        @transactions = Transaction.all
    end
end