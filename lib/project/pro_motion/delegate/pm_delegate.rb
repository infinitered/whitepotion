module ProMotion
  class Delegate
    include ProMotion::DelegateModule

    def alert(options={}, &block)
      AlertDialog.new(options, &block)
    end
  end
end