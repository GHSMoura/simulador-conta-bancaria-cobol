IDENTIFICATION DIVISION.
PROGRAM-ID. CONTA-BANCARIA.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 TITULAR         PIC A(30).
01 SALDO           PIC 9(5)V99 VALUE 0.
01 VALOR-OPERACAO  PIC 9(5)V99.
01 OPCAO           PIC 9.

PROCEDURE DIVISION.

    DISPLAY "=== SISTEMA BANCÁRIO ===".
    DISPLAY "Digite o nome do titular da conta: ".
    ACCEPT TITULAR.

    PERFORM UNTIL OPCAO = 3
        DISPLAY "-----------------------------"
        DISPLAY "1 - Depositar"
        DISPLAY "2 - Sacar"
        DISPLAY "3 - Sair"
        DISPLAY "Escolha uma opção: "
        ACCEPT OPCAO

        IF OPCAO = 1 THEN
            DISPLAY "Digite o valor para depósito: "
            ACCEPT VALOR-OPERACAO
            ADD VALOR-OPERACAO TO SALDO
            DISPLAY "Depósito realizado. Saldo atual: R$" SALDO
        ELSE
            IF OPCAO = 2 THEN
                DISPLAY "Digite o valor para saque: "
                ACCEPT VALOR-OPERACAO
                IF VALOR-OPERACAO > SALDO THEN
                    DISPLAY "Saldo insuficiente para saque."
                ELSE
                    SUBTRACT VALOR-OPERACAO FROM SALDO
                    DISPLAY "Saque realizado. Saldo atual: R$" SALDO
                END-IF
            ELSE
                IF OPCAO NOT = 3 THEN
                    DISPLAY "Opção inválida. Tente novamente."
                END-IF
            END-IF
        END-IF
    END-PERFORM.

    DISPLAY "Obrigado por usar o sistema, " TITULAR.
    DISPLAY "Saldo final: R$" SALDO.
    STOP RUN.
