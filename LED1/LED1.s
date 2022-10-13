;RCC_APB2ENR EQU 0x40021018;����RCC�Ĵ���,ʱ��,0x40021018Ϊʱ�ӵ�ַ


;GPIOB_BASE EQU 0x40010C00
;GPIOC_BASE EQU 0x40011000
;GPIOA_BASE EQU 0x40010800
;GPIOB_CRH EQU 0x40010C04
;GPIOC_CRH EQU 0x40011004
;GPIOA_CRL EQU 0x40010800
;GPIOB_ODR EQU 0x40010C0C
;GPIOC_ODR EQU 0x4001100C
;GPIOA_ODR EQU 0x4001080C
Stack_Size EQU  0x00000400;ջ�Ĵ�С
	
                AREA    STACK, NOINIT, READWRITE, ALIGN=3 ;NOINIT�� = NO Init������ʼ����READWRITE : �ɶ�����д��ALIGN =3 : 2^3 ���룬��8�ֽڶ��롣
Stack_Mem       SPACE   Stack_Size
__initial_sp




                AREA    RESET, DATA, READONLY

__Vectors       DCD     __initial_sp               ; Top of Stack
                DCD     Reset_Handler              ; Reset Handler
                    
                    
                AREA    |.text|, CODE, READONLY
                    
                THUMB
                REQUIRE8
                PRESERVE8
                    
                ENTRY
Reset_Handler 
				bl LED_Init;bl�������ӵ���תָ���ʹ�ø�ָ����תʱ����ǰ��ַ(PC)���Զ�����LR�Ĵ���
MainLoop		BL LED_ON_B
                BL Delay
                BL LED_OFF_B
                BL Delay        
				BL LED_ON_C
                BL Delay
                BL LED_OFF_C
                BL Delay
				BL LED_ON_A
                BL Delay
                BL LED_OFF_A
                BL Delay

                
                B MainLoop;B:��������ת��
LED_Init;LED��ʼ��
                PUSH {R0,R1, LR};R0,R1,LR�е�ֵ�����ջ
                ;����ʱ��
                LDR R0,=0x40021018;LDR�ǰѵ�ַװ�ص��Ĵ�����(����R0)��
                ORR R0,R0,#0x1c
                LDR R1,=0x40021018
                STR R0,[R1]
				
				
                ;��ʼ��GPIOA_CRL
                LDR R0,=0x40010800
                BIC R0,R0,#0xfff0ffff;BIC �Ȱ�������ȡ�����ٰ�λ��
                LDR R1,=0x40010800
                STR R0,[R1]
				
                LDR R0,=0x40010800
                ORR R0,#0x00010000
                LDR R1,=0x40010800
                STR R0,[R1]
                ;��PA4��1
                MOV R0,#0x10
                LDR R1,=0x4001080C
                STR R0,[R1]
				
				
                ;��ʼ��GPIOB_CRL
                LDR R0,=0x40010C04
                BIC R0,R0,#0xffffff0f;BIC �Ȱ�������ȡ�����ٰ�λ��
                LDR R1,=0x40010C04
                STR R0,[R1]
				
                LDR R0,=0x40010C04
                ORR R0,#0x00000020
                LDR R1,=0x40010C04
                STR R0,[R1]
                ;��PB9��1
                MOV R0,#0x200
                LDR R1,=0x40010C0C
                STR R0,[R1]
				
				
				 ;��ʼ��GPIOC
                LDR R0,=0x40011004
                BIC R0,R0,#0x0fffffff
                LDR R1,=0x40011004
                STR R0,[R1]
				
                LDR R0,=0x40011004
                ORR R0,#0x30000000
                LDR R1,=0x40011004
                STR R0,[R1]
                ;��PC15��1
                MOV R0,#0x8000
                LDR R1,=0x4001100C
                STR R0,[R1]
             
                POP {R0,R1,PC};��ջ��֮ǰ���R0��R1��LR��ֵ������R0��R1��PC
LED_ON_B;����
                PUSH {R0,R1, LR}    
                
                MOV R0,#0x000
                LDR R1,=0x40010C0C
                STR R0,[R1]
             
                POP {R0,R1,PC}
             
LED_OFF_B;Ϩ��
                PUSH {R0,R1, LR}    
                
                MOV R0,#0x200
                LDR R1,=0x40010C0C
                STR R0,[R1]
             
                POP {R0,R1,PC}  
LED_ON_C;����
                PUSH {R0,R1, LR}    
                
                MOV R0,#0x0000
                LDR R1,=0x4001100C
                STR R0,[R1]
             
                POP {R0,R1,PC}
             
LED_OFF_C;Ϩ��
                PUSH {R0,R1, LR}    
                
                MOV R0,#0x8000
                LDR R1,=0x4001100C
                STR R0,[R1]
             
                POP {R0,R1,PC}             
LED_ON_A
                PUSH {R0,R1, LR}    
                                           
                MOV R0,#0x00                
                LDR R1,=0x4001080C               
                STR R0,[R1]   
                                          
                POP {R0,R1,PC}				            
LED_OFF_A                
                PUSH {R0,R1, LR}    
                                                
                MOV R0,#0x10                
                LDR R1,=0x4001080C              
                STR R0,[R1]  
                                                 
                POP {R0,R1,PC}       
Delay
                PUSH {R0,R1, LR}
                
                MOVS R0,#0
                MOVS R1,#0
                MOVS R2,#0
                
DelayLoop0        
                ADDS R0,R0,#1

                CMP R0,#330
                BCC DelayLoop0
                
                MOVS R0,#0
                ADDS R1,R1,#1
                CMP R1,#330
                BCC DelayLoop0

                MOVS R0,#0
                MOVS R1,#0
                ADDS R2,R2,#1
                CMP R2,#15
                BCC DelayLoop0
                
                
                POP {R0,R1,PC}    
                NOP
				END


