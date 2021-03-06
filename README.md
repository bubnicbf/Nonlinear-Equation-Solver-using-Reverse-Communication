# Nonlinear-Equation-Solver-using-Reverse-Communication
Calculates solutions of a scalar nonlinear equation f(x)=0, or a system of nonlinear equations, using reverse communication (RC)

One of the standard problems in numerical analysis is to determine an approximate solution to a scalar nonlinear equation of the form $f(x)=0$.

Reliable and efficient procedures for this task, sometimes called "zero finders" or "root solvers" are available in many libraries. These procedures typically require the user to write a sub-procedure to evaluate the function for any argument $x$; the form and list of arguments for this sub-procedure are strictly prescribed by the library procedure. The user must somehow make this sub-procedure available to the solver, either by using a fixed name for the sub-procedure, or by passing in the actual name as an argument.

In many cases, it can be inconvenient to use such a library routine, because it is inserted between the main user program and the user function. This means that data defining the function, which might be chosen in the main program, must then somehow be communicated to the user function, perhaps by declaring some kind of global memory, or by sneaking the data through in an extra argument provided by the library procedure, or by the use of auxilliary data files.

Moreover, the user essentially loses control of the process until the library procedure returns. It might, however, be the case that the user could detect important error conditions, or gather useful information, if the intermediate x values generated by the library procedure were visible.

If we denote this typical method of interaction between a user and a library an instance of "forward communication", then there is an alternative approach, known as "reverse communication", which allows the user much more freedom in designing the function evaluation, and in observing and intervening in the iteration that is seeking the solution.

####An idealized version of the use of a reverse communication zero finder might look like this:

        x = initial approximation.
        while ( not satisfied )
          fx = f(x)
          x = root ( x, fx )
        end
      
Here, "not satisfied" might simply be a test of the magnitude of $f(x)$. But note two things:
The function $f(x)$ is evaluated within the main program. The user could write an actual procedure to evaluate $f(x)$, but in that case the user is free to design the interface to $f(x)$ in any desired way. More importantly, the user can evaluate $f(x)$ directly in the main program, and has access to all the data in the main program that might be needed to evaluate the function.

The user sees every iterate $x$ produced by the zero finder. This means the user can catch and occasionally correct problems that might arise if $x$ goes out of prescribed bounds; the user can print a table of the computed values, or plot the sequence of function values.

Reverse communication zero finders can be very useful in situations where the function to be evaluated is actually the outcome of a complicated process. For instance, if we are seeking an eigenvalue x that makes the determinant of some matrix zero, then our function evaluation may require us to form a large matrix and to factor it in order to evaluate the determinant. This may be cumbersome to do if we must perform all these operations in a sub-procedure.

Similarly, we might be solving a boundary value problem using the shooting method, and $f(x)$ might be the deviation at the final time between the computed and desired boundary values. In that case, a subprocedure formulation would require us to set up and solve a boundary value problem repeatedly in an isolated piece of code.
