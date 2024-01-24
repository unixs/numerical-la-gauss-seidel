C     Gauss-Seidel Matrix solve method
      PROGRAM GAUSS_SEIDEL_TEST
        PARAMETER (E = 0.001)
        PARAMETER (N = 3)
        REAL A, B, X
        DIMENSION A(N,N), B(N), X(N)
        DATA A /1., -0.15, -0.4, 0.1, 1., -0.025, 0.225, 0.2, 1./,
     &       B /0.1, 0.9, 0.8/,
     &       X /N * 0/

        CALL GAUSS_SEIDEL(N, E, A, B, X)

C       Print results:
        PRINT 510, "A"
        DO 100 I = 1, N
          PRINT 520, (A(I, J), J = 1, N)
100     CONTINUE

        PRINT 500, "B"
        PRINT 520, (B(I), I = 1, N)

        PRINT 500, "X"
        PRINT 520, (X(I), I = 1, N)

500     FORMAT (1X, /A, 1X, "VECTOR:")
510     FORMAT (1X, /A, 1X, "MATRIX:")
520     FORMAT (100(1X, F6.3))
      END
