@echo off
:: Verificar se o Python está instalado
python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo Python nao encontrado. Por favor, instale o Python e tente novamente.
    exit /b 1
)

:: Criar o ambiente virtual, se nao existir
if not exist venv (
    echo Criando ambiente virtual...
    python -m venv venv
) else (
    echo Ambiente virtual ja existe.
)

:: Ativar o ambiente virtual
call venv\Scripts\activate

:: Atualizar pip
echo Atualizando o pip...
python -m pip install --upgrade pip wheel setuptools

:: Instalar dependencias do pre-commit
echo Instalando dependencias...
pip install -r requirements.txt

echo Ambiente configurado com sucesso!
pause