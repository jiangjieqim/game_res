/*
	���� + �߹� + ��ͼ
*/
uniform mat4 _mat1;//�˾�����Ϊһ��ģ�ͱ任����,�ⲿ����
uniform float bSpecular;//�Ƿ����ø߹�
varying vec4 color;//��Ƭ����ɫ�䴫�ݵĲ��� 
uniform mat4 _PerspectiveMatrix4x4;
uniform mat4 _ModelViewMatrix4x4;
void main()
{
	
	vec3 lightposition = vec3(100,100,100);	//��Դλ��
	vec3 eyeposition = vec3(0,10,30);	//�������
	vec4 ambient=vec4(1.0,0.0,0.0,0.0);	//��������ɫ
	vec4 lightcolor=vec4(1.0,1.0,1.0,1.0);	//��Դ��ɫ
	float Ns = 8.5;//�߹�ϵ�� ��ֵ��Ҫ>1.0����������
	float attenuation=0.8;//���ߵ�˥��ϵ��	,��ֵԽ��,��߹��ȦԽ��
	
	//======================================================

	vec3 ECPosition = vec3(gl_ModelViewMatrix * gl_Vertex);

	vec3 N = normalize(gl_NormalMatrix * gl_Normal);
 	vec3 L = normalize(lightposition - ECPosition);
 	vec3 V = normalize(eyeposition - ECPosition);
 	vec3 H = normalize(V + L); 
	
	vec4 diffuse = lightcolor*max(dot(N , L),0);
 	
	if(bSpecular>0){
		vec4 specular = lightcolor * pow(max(dot(N , H) , 0) , Ns) * attenuation;
		
		//ע:diffuse + specular����>0,������clampȡ0~1.0֮���ֵ,��ֹ�ع�
		color=clamp((diffuse + specular),0.0,1.0);
	}else{
		color=diffuse;//ֻȡ����ֵ
	}
	
	gl_TexCoord[0] = gl_MultiTexCoord0;
	//gl_Position = gl_ModelViewProjectionMatrix*_mat1*gl_Vertex;

	gl_Position = _PerspectiveMatrix4x4*_ModelViewMatrix4x4*_mat1*vec4(gl_Vertex.xyz, 1.0);
}
