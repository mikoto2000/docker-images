# ShowUI-2B for NVIDIA DGX Spark (GB10 / sm_121a)
#
[>4;0m# ShowUI-2B は Qwen2-VL ベースの Vision-Language-Action (VLA) モデル。
# DGX Spark は ARM64 (aarch64) + Blackwell sm_121a のため、
# 標準の x86 向け vLLM イメージは動かない。
# 公式の CUDA 13 nightly 系イメージが sm_121 対応の実績ある経路。
#   参考: https://vllm.ai/blog/2026-06-01-vllm-dgx-spark
#
# 注意: cu130-nightly は動くタグ。再現性が要るなら、
#       特定の release タグ / commit 指定 nightly / image digest に固定すること。
# ShowUI-2B for NVIDIA DGX Spark (GB10 / sm_121a)
#
# ShowUI-2B は Qwen2-VL ベースの Vision-Language-Action (VLA) モデル。
# DGX Spark は ARM64 (aarch64) + Blackwell sm_121a のため、
# 標準の x86 向け vLLM イメージは動かない。
# 公式の CUDA 13 nightly 系イメージが sm_121 対応の実績ある経路。
#   参考: https://vllm.ai/blog/2026-06-01-vllm-dgx-spark
#
# 注意: cu130-nightly は動くタグ。再現性が要るなら、
#       特定の release タグ / commit 指定 nightly / image digest に固定すること。

FROM vllm/vllm-openai:cu130-nightly

# --- 非 root 実行（ハードニング） ---
USER root
RUN useradd -m -u 1000 vllm 2>/dev/null || true
RUN mkdir -p /models /home/vllm/.cache/huggingface && \
    chown -R vllm:vllm /models /home/vllm/.cache/huggingface
RUN mkdir -p /models /home/vllm/.cache/vllm && \
    chown -R vllm:vllm /models /home/vllm/.cache/vllm
RUN mkdir -p /models /home/vllm/.cache/flashinfer && \
    chown -R vllm:vllm /models /home/vllm/.cache/flashinfer
USER vllm

# --- ランタイム既定値 ---
# モデルは `vllm serve` の引数で渡す（compose の command で指定）。
ENV HF_HOME=/home/vllm/.cache/huggingface \
    VLLM_HOST_IP=0.0.0.0

EXPOSE 8000

# 既定コマンド: serve。モデルやフラグは compose / run 時に上書きする。
ENTRYPOINT ["vllm", "serve"]
CMD ["--host", "0.0.0.0", "--port", "8000"]
