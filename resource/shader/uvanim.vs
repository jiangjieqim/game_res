uniform mat4 _mat1;//�˾�����Ϊһ��ģ�ͱ任����,�ⲿ����
void main(){
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_Position = gl_ModelViewProjectionMatrix*_mat1*gl_Vertex;
}
