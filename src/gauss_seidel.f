      SUBROUTINE GAUSS_SEIDEL(DIM, E, A, B, X)
        PARAMETER (MAX_ITER = 500)
        INTEGER DIM
        REAL NORMV, NORM
        DIMENSION A(DIM,DIM), B(DIM), X(DIM), NORMV(DIM)

        ITER = 0

10      DO 20 I = 1, DIM
          S = 0
          DO 30 J = 1, DIM
            IF (I.NE.J) THEN
              S = S + A(I, J) * X(J)
            END IF
30        CONTINUE

          XT = (1 / A(I, I)) * (B(I) - S)
          NORMV(I) = ABS(X(I) - XT)
          X(I) = XT
20      CONTINUE

C       Euclidean norm from LAPACK
        NORM = SNRM2(DIM, NORMV, 1)
        ITER = ITER + 1

        IF (NORM .GT. E) THEN
          IF (ITER .LT. MAX_ITER) THEN
            GOTO 10
          ELSE
            STOP "MAX ITERATIONS EXCEEDED"
          END IF
        END IF

      END
