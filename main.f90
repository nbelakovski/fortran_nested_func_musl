module progmod

    public :: objective_function

    contains

    subroutine objective_function()
    end subroutine objective_function

end module progmod

program hello

use algorithm, only : algorithm_with_nested_function
use progmod, only : objective_function

call algorithm_with_nested_function(objective_function)
print *, "DONE"

end program hello
