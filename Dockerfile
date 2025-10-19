# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.4.1-base

# install custom nodes into comfyui
RUN comfy-node-install ComfyUI-SAM2 ComfyUI-WAS-Node-Suite
# Note: pr-was-node-suite-comfyui-47064894 could not be found in registry or via web search

# download models and put them into the correct folders in comfyui
RUN comfy model download --url https://huggingface.co/TheImposterImposters/lustifySDXLNSFW_v20-inpainting/resolve/main/lustifySDXLNSFW_v20-inpainting.safetensors --relative-path models/checkpoints --filename lustifySDXLNSFW_oltINPAINTING.safetensors
# RUN # Could not find URL for lustifySDXLNSFW_oltINPAINTING.safetensors

# copy all input data (like images or videos) into comfyui
COPY input/ /comfyui/input/