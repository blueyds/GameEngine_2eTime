#include <metal_stdlib>

struct VertexIn{
	float3 position [[ attribute(0) ]];
	float4 color [[ attribute(1) ]];
};
struct RasterizerData{
	float4 position [[ position ]];
	float4 color;
};
struct ModelConstants{
	metal::float4x4 modelMatrix;
};
struct SceneConstants{
	metal::float4x4 viewMatrix;
	metal::float4x4 projectionMatrix;
};

struct Material {
	float4 color;
	bool useMaterialColor;
	};
