# lambda

## aws lambda layer

```bash
pip install -r requirements.txt -t build/python

cd build

zip -r python.zip python

aws lambda publish-layer-version \
  --region us-east-1 \
  --layer-name chatgpt-slack-layer \
  --zip-file fileb://python.zip \
  --compatible-runtimes python3.9
```
