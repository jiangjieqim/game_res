//layout(location = 0) in vec4 vPosition;
#version 110
uniform mat4 _mat1;//�˾�����Ϊһ��ģ�ͱ任����,�ⲿ����
uniform mat4 _PerspectiveMatrix4x4;
uniform mat4 _ModelViewMatrix4x4;
uniform float _uvScale;//uv����ֵ

void main(){
	//gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy * _uvScale;
	
	gl_Position = _PerspectiveMatrix4x4 * _ModelViewMatrix4x4 * _mat1 * vec4(gl_Vertex.xyz, 1.0);
}