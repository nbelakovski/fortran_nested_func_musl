module algorithm

    implicit none
    private
    public :: algorithm_with_nested_function

    abstract interface

    subroutine OBJ()
    end subroutine OBJ

    end interface
    
    contains
    
    subroutine algorithm_with_nested_function()
        call nested_function()  ! This works
        call evaluate(nested_function)
        contains
        
        subroutine nested_function()
            print *, "nested function"
        end subroutine nested_function
    
    end subroutine algorithm_with_nested_function

    subroutine evaluate(a_nested_function)
        procedure(OBJ) :: a_nested_function
        call a_nested_function()  ! This fails
    end subroutine evaluate
    
end module algorithm
