/*
	���ŷ��߷���ƫ�Ƽ�����λ

	ʹ��fixed function pipeline��һ����Ч�ķ������Ȼ���һ������ģ�͵�stencil buffer��
	Ȼ��ʹ�ôֵ��߿����һ��ģ�͵�wireframe��ֻ��stencil buffer�Ϸ�ģ�Ͳ��֣������������߾ͻ��Ƴ����ˡ�����ٻ�һ��ģ�;ͺ��ˡ��μ�Generating Outlines in OpenGL

*/
uniform mat4 _mat1;
uniform mat4 _PerspectiveMatrix4x4;
uniform mat4 _ModelViewMatrix4x4;

uniform float _LineWidth;//��Ե�߿��
void main()
{
	float offsetLine = _LineWidth;
	
	vec3 n = normalize (gl_Normal) * offsetLine;
	
	vec4 _pos = gl_Vertex ;

	_pos.xyz+=n.xyz;
	
	
	gl_Position = _PerspectiveMatrix4x4	*	_ModelViewMatrix4x4	*	_mat1	*	vec4(_pos.xyz, 1.0);
}

/*
	float offsetLine = _LineWidth;
	
	vec3 n = normalize (gl_Normal) * offsetLine;
	
	vec4 _pos = gl_Vertex ;

	_pos.xyz+=n.xyz;
	
	gl_Position = _PerspectiveMatrix4x4	*	_ModelViewMatrix4x4	*	_mat1	*	vec4(_pos.xyz, 1.0);

*/