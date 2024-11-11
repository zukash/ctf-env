# ctf-env

CTF environment for Apple Silicon

## Docker

```bash
brew install colima docker
colima start --profile x86_64 --arch x86_64 --cpu 8 --memory 8
```

## SageMath

```bash
pyenv install miniforge3-24.3.0-0
pyenv global miniforge3-24.3.0-0 $(pyenv global)
mamba install sage
python -c "from sage.all import *; print(factor(123))" # 3 * 41
```

## ctftools

ref. <https://github.com/zukash/ctftools>

```bash
pip install git+https://github.com/zukash/ctftools.git
```
