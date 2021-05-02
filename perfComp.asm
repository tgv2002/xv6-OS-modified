
_perfComp:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

	while(wait() != -1);
}

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 0c             	sub    $0xc,%esp
	if(argc != 3)
  13:	83 39 03             	cmpl   $0x3,(%ecx)
{
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
	if(argc != 3)
  19:	74 13                	je     2e <main+0x2e>
	{
		printf(1,"Two arguments <processes type> and  <Number of processes> are needed\n");
  1b:	51                   	push   %ecx
  1c:	51                   	push   %ecx
  1d:	68 a8 08 00 00       	push   $0x8a8
  22:	6a 01                	push   $0x1
  24:	e8 f7 04 00 00       	call   520 <printf>
		exit();
  29:	e8 94 03 00 00       	call   3c2 <exit>
	}

	int n = atoi(argv[2]);
  2e:	83 ec 0c             	sub    $0xc,%esp
  31:	ff 73 08             	pushl  0x8(%ebx)
  34:	e8 17 03 00 00       	call   350 <atoi>
	int type = atoi(argv[1]);
  39:	5a                   	pop    %edx
  3a:	ff 73 04             	pushl  0x4(%ebx)
	int n = atoi(argv[2]);
  3d:	89 c6                	mov    %eax,%esi
	int type = atoi(argv[1]);
  3f:	e8 0c 03 00 00       	call   350 <atoi>

	if(type == 0)
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c0                	test   %eax,%eax
  49:	74 29                	je     74 <main+0x74>
		cpuBoundProcesses(n);
	else if(type == 1)
  4b:	83 e8 01             	sub    $0x1,%eax
  4e:	74 16                	je     66 <main+0x66>
		ioBoundProcesses(n);
	else
	{
		printf(1, "Invalid type argument :(\n");
  50:	50                   	push   %eax
  51:	50                   	push   %eax
  52:	68 8e 08 00 00       	push   $0x88e
  57:	6a 01                	push   $0x1
  59:	e8 c2 04 00 00       	call   520 <printf>
  5e:	83 c4 10             	add    $0x10,%esp
	}

	exit();
  61:	e8 5c 03 00 00       	call   3c2 <exit>
		ioBoundProcesses(n);
  66:	83 ec 0c             	sub    $0xc,%esp
  69:	56                   	push   %esi
  6a:	e8 81 00 00 00       	call   f0 <ioBoundProcesses>
  6f:	83 c4 10             	add    $0x10,%esp
  72:	eb ed                	jmp    61 <main+0x61>
		cpuBoundProcesses(n);
  74:	83 ec 0c             	sub    $0xc,%esp
  77:	56                   	push   %esi
  78:	e8 13 00 00 00       	call   90 <cpuBoundProcesses>
  7d:	83 c4 10             	add    $0x10,%esp
  80:	eb df                	jmp    61 <main+0x61>
  82:	66 90                	xchg   %ax,%ax
  84:	66 90                	xchg   %ax,%ax
  86:	66 90                	xchg   %ax,%ax
  88:	66 90                	xchg   %ax,%ax
  8a:	66 90                	xchg   %ax,%ax
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <cpuBoundProcesses>:
void cpuBoundProcesses(int n){
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 75 08             	mov    0x8(%ebp),%esi
	for(int i = 0; i < n; i++)
  98:	85 f6                	test   %esi,%esi
  9a:	7e 14                	jle    b0 <cpuBoundProcesses+0x20>
  9c:	31 db                	xor    %ebx,%ebx
  9e:	66 90                	xchg   %ax,%ax
		int pid = fork();
  a0:	e8 15 03 00 00       	call   3ba <fork>
		if(pid == 0)
  a5:	85 c0                	test   %eax,%eax
  a7:	74 18                	je     c1 <cpuBoundProcesses+0x31>
	for(int i = 0; i < n; i++)
  a9:	83 c3 01             	add    $0x1,%ebx
  ac:	39 de                	cmp    %ebx,%esi
  ae:	75 f0                	jne    a0 <cpuBoundProcesses+0x10>
	while(wait()!=-1);
  b0:	e8 15 03 00 00       	call   3ca <wait>
  b5:	83 f8 ff             	cmp    $0xffffffff,%eax
  b8:	75 f6                	jne    b0 <cpuBoundProcesses+0x20>
}
  ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
  bd:	5b                   	pop    %ebx
  be:	5e                   	pop    %esi
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    
			for(double z = 0; z < 1200000.0; z+= 0.01)
  c1:	d9 ee                	fldz   
  c3:	dd 05 f0 08 00 00    	fldl   0x8f0
  c9:	dc c1                	fadd   %st,%st(1)
  cb:	d9 05 f8 08 00 00    	flds   0x8f8
  d1:	df ea                	fucomip %st(2),%st
  d3:	77 f4                	ja     c9 <cpuBoundProcesses+0x39>
  d5:	dd d8                	fstp   %st(0)
  d7:	dd d8                	fstp   %st(0)
			printf(1, "Process: %d Finished\n", i);
  d9:	83 ec 04             	sub    $0x4,%esp
  dc:	53                   	push   %ebx
  dd:	68 78 08 00 00       	push   $0x878
  e2:	6a 01                	push   $0x1
  e4:	e8 37 04 00 00       	call   520 <printf>
			exit(); 
  e9:	e8 d4 02 00 00       	call   3c2 <exit>
  ee:	66 90                	xchg   %ax,%ax

000000f0 <ioBoundProcesses>:
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	83 ec 0c             	sub    $0xc,%esp
  f9:	8b 7d 08             	mov    0x8(%ebp),%edi
	for (int i = 0; i < n; i++)
  fc:	85 ff                	test   %edi,%edi
  fe:	7e 20                	jle    120 <ioBoundProcesses+0x30>
 100:	31 db                	xor    %ebx,%ebx
 102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		int pid = fork();
 108:	e8 ad 02 00 00       	call   3ba <fork>
		if(pid == 0)
 10d:	85 c0                	test   %eax,%eax
		int pid = fork();
 10f:	89 c6                	mov    %eax,%esi
		if(pid == 0)
 111:	74 1f                	je     132 <ioBoundProcesses+0x42>
	for (int i = 0; i < n; i++)
 113:	83 c3 01             	add    $0x1,%ebx
 116:	39 df                	cmp    %ebx,%edi
 118:	75 ee                	jne    108 <ioBoundProcesses+0x18>
 11a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
	while(wait()!=-1);
 120:	e8 a5 02 00 00       	call   3ca <wait>
 125:	83 f8 ff             	cmp    $0xffffffff,%eax
 128:	75 f6                	jne    120 <ioBoundProcesses+0x30>
}
 12a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 12d:	5b                   	pop    %ebx
 12e:	5e                   	pop    %esi
 12f:	5f                   	pop    %edi
 130:	5d                   	pop    %ebp
 131:	c3                   	ret    
			for(int k = 0; k < 80*n; k++)
 132:	8d 3c bf             	lea    (%edi,%edi,4),%edi
 135:	c1 e7 04             	shl    $0x4,%edi
				sleep(10);    // I/O
 138:	83 ec 0c             	sub    $0xc,%esp
			for(int k = 0; k < 80*n; k++)
 13b:	83 c6 01             	add    $0x1,%esi
				sleep(10);    // I/O
 13e:	6a 0a                	push   $0xa
 140:	e8 25 03 00 00       	call   46a <sleep>
			for(int k = 0; k < 80*n; k++)
 145:	83 c4 10             	add    $0x10,%esp
 148:	39 fe                	cmp    %edi,%esi
 14a:	75 ec                	jne    138 <ioBoundProcesses+0x48>
			printf(1, "Process: %d Finished\n", i);
 14c:	83 ec 04             	sub    $0x4,%esp
 14f:	53                   	push   %ebx
 150:	68 78 08 00 00       	push   $0x878
 155:	6a 01                	push   $0x1
 157:	e8 c4 03 00 00       	call   520 <printf>
			exit(); 
 15c:	e8 61 02 00 00       	call   3c2 <exit>
 161:	66 90                	xchg   %ax,%ax
 163:	66 90                	xchg   %ax,%ax
 165:	66 90                	xchg   %ax,%ax
 167:	66 90                	xchg   %ax,%ax
 169:	66 90                	xchg   %ax,%ax
 16b:	66 90                	xchg   %ax,%ax
 16d:	66 90                	xchg   %ax,%ax
 16f:	90                   	nop

00000170 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 17a:	89 c2                	mov    %eax,%edx
 17c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 180:	83 c1 01             	add    $0x1,%ecx
 183:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 187:	83 c2 01             	add    $0x1,%edx
 18a:	84 db                	test   %bl,%bl
 18c:	88 5a ff             	mov    %bl,-0x1(%edx)
 18f:	75 ef                	jne    180 <strcpy+0x10>
    ;
  return os;
}
 191:	5b                   	pop    %ebx
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
 1a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1aa:	0f b6 02             	movzbl (%edx),%eax
 1ad:	0f b6 19             	movzbl (%ecx),%ebx
 1b0:	84 c0                	test   %al,%al
 1b2:	75 1c                	jne    1d0 <strcmp+0x30>
 1b4:	eb 2a                	jmp    1e0 <strcmp+0x40>
 1b6:	8d 76 00             	lea    0x0(%esi),%esi
 1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 1c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 1c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1c6:	83 c1 01             	add    $0x1,%ecx
 1c9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 1cc:	84 c0                	test   %al,%al
 1ce:	74 10                	je     1e0 <strcmp+0x40>
 1d0:	38 d8                	cmp    %bl,%al
 1d2:	74 ec                	je     1c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 1d4:	29 d8                	sub    %ebx,%eax
}
 1d6:	5b                   	pop    %ebx
 1d7:	5d                   	pop    %ebp
 1d8:	c3                   	ret    
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 1e2:	29 d8                	sub    %ebx,%eax
}
 1e4:	5b                   	pop    %ebx
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strlen>:

uint
strlen(const char *s)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1f6:	80 39 00             	cmpb   $0x0,(%ecx)
 1f9:	74 15                	je     210 <strlen+0x20>
 1fb:	31 d2                	xor    %edx,%edx
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
 200:	83 c2 01             	add    $0x1,%edx
 203:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 207:	89 d0                	mov    %edx,%eax
 209:	75 f5                	jne    200 <strlen+0x10>
    ;
  return n;
}
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 210:	31 c0                	xor    %eax,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <memset>:

void*
memset(void *dst, int c, uint n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 227:	8b 4d 10             	mov    0x10(%ebp),%ecx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 d7                	mov    %edx,%edi
 22f:	fc                   	cld    
 230:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 232:	89 d0                	mov    %edx,%eax
 234:	5f                   	pop    %edi
 235:	5d                   	pop    %ebp
 236:	c3                   	ret    
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <strchr>:

char*
strchr(const char *s, char c)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 24a:	0f b6 10             	movzbl (%eax),%edx
 24d:	84 d2                	test   %dl,%dl
 24f:	74 1d                	je     26e <strchr+0x2e>
    if(*s == c)
 251:	38 d3                	cmp    %dl,%bl
 253:	89 d9                	mov    %ebx,%ecx
 255:	75 0d                	jne    264 <strchr+0x24>
 257:	eb 17                	jmp    270 <strchr+0x30>
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 260:	38 ca                	cmp    %cl,%dl
 262:	74 0c                	je     270 <strchr+0x30>
  for(; *s; s++)
 264:	83 c0 01             	add    $0x1,%eax
 267:	0f b6 10             	movzbl (%eax),%edx
 26a:	84 d2                	test   %dl,%dl
 26c:	75 f2                	jne    260 <strchr+0x20>
      return (char*)s;
  return 0;
 26e:	31 c0                	xor    %eax,%eax
}
 270:	5b                   	pop    %ebx
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	56                   	push   %esi
 285:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 286:	31 f6                	xor    %esi,%esi
 288:	89 f3                	mov    %esi,%ebx
{
 28a:	83 ec 1c             	sub    $0x1c,%esp
 28d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 290:	eb 2f                	jmp    2c1 <gets+0x41>
 292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 298:	8d 45 e7             	lea    -0x19(%ebp),%eax
 29b:	83 ec 04             	sub    $0x4,%esp
 29e:	6a 01                	push   $0x1
 2a0:	50                   	push   %eax
 2a1:	6a 00                	push   $0x0
 2a3:	e8 4a 01 00 00       	call   3f2 <read>
    if(cc < 1)
 2a8:	83 c4 10             	add    $0x10,%esp
 2ab:	85 c0                	test   %eax,%eax
 2ad:	7e 1c                	jle    2cb <gets+0x4b>
      break;
    buf[i++] = c;
 2af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2b3:	83 c7 01             	add    $0x1,%edi
 2b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 2b9:	3c 0a                	cmp    $0xa,%al
 2bb:	74 23                	je     2e0 <gets+0x60>
 2bd:	3c 0d                	cmp    $0xd,%al
 2bf:	74 1f                	je     2e0 <gets+0x60>
  for(i=0; i+1 < max; ){
 2c1:	83 c3 01             	add    $0x1,%ebx
 2c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2c7:	89 fe                	mov    %edi,%esi
 2c9:	7c cd                	jl     298 <gets+0x18>
 2cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 2d0:	c6 03 00             	movb   $0x0,(%ebx)
}
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    
 2db:	90                   	nop
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2e0:	8b 75 08             	mov    0x8(%ebp),%esi
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	01 de                	add    %ebx,%esi
 2e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 2ea:	c6 03 00             	movb   $0x0,(%ebx)
}
 2ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f0:	5b                   	pop    %ebx
 2f1:	5e                   	pop    %esi
 2f2:	5f                   	pop    %edi
 2f3:	5d                   	pop    %ebp
 2f4:	c3                   	ret    
 2f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 305:	83 ec 08             	sub    $0x8,%esp
 308:	6a 00                	push   $0x0
 30a:	ff 75 08             	pushl  0x8(%ebp)
 30d:	e8 08 01 00 00       	call   41a <open>
  if(fd < 0)
 312:	83 c4 10             	add    $0x10,%esp
 315:	85 c0                	test   %eax,%eax
 317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 319:	83 ec 08             	sub    $0x8,%esp
 31c:	ff 75 0c             	pushl  0xc(%ebp)
 31f:	89 c3                	mov    %eax,%ebx
 321:	50                   	push   %eax
 322:	e8 0b 01 00 00       	call   432 <fstat>
  close(fd);
 327:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 32a:	89 c6                	mov    %eax,%esi
  close(fd);
 32c:	e8 d1 00 00 00       	call   402 <close>
  return r;
 331:	83 c4 10             	add    $0x10,%esp
}
 334:	8d 65 f8             	lea    -0x8(%ebp),%esp
 337:	89 f0                	mov    %esi,%eax
 339:	5b                   	pop    %ebx
 33a:	5e                   	pop    %esi
 33b:	5d                   	pop    %ebp
 33c:	c3                   	ret    
 33d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 340:	be ff ff ff ff       	mov    $0xffffffff,%esi
 345:	eb ed                	jmp    334 <stat+0x34>
 347:	89 f6                	mov    %esi,%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 11             	movsbl (%ecx),%edx
 35a:	8d 42 d0             	lea    -0x30(%edx),%eax
 35d:	3c 09                	cmp    $0x9,%al
  n = 0;
 35f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 364:	77 1f                	ja     385 <atoi+0x35>
 366:	8d 76 00             	lea    0x0(%esi),%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 370:	8d 04 80             	lea    (%eax,%eax,4),%eax
 373:	83 c1 01             	add    $0x1,%ecx
 376:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 37a:	0f be 11             	movsbl (%ecx),%edx
 37d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 380:	80 fb 09             	cmp    $0x9,%bl
 383:	76 eb                	jbe    370 <atoi+0x20>
  return n;
}
 385:	5b                   	pop    %ebx
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    
 388:	90                   	nop
 389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	53                   	push   %ebx
 395:	8b 5d 10             	mov    0x10(%ebp),%ebx
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 db                	test   %ebx,%ebx
 3a0:	7e 14                	jle    3b6 <memmove+0x26>
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 3a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 3b2:	39 d3                	cmp    %edx,%ebx
 3b4:	75 f2                	jne    3a8 <memmove+0x18>
  return vdst;
}
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    

000003ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3ba:	b8 01 00 00 00       	mov    $0x1,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <exit>:
SYSCALL(exit)
 3c2:	b8 02 00 00 00       	mov    $0x2,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <wait>:
SYSCALL(wait)
 3ca:	b8 03 00 00 00       	mov    $0x3,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <waitx>:
SYSCALL(waitx)
 3d2:	b8 16 00 00 00       	mov    $0x16,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <set_priority>:
SYSCALL(set_priority)
 3da:	b8 18 00 00 00       	mov    $0x18,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <psCall>:
SYSCALL(psCall)
 3e2:	b8 17 00 00 00       	mov    $0x17,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <pipe>:
SYSCALL(pipe)
 3ea:	b8 04 00 00 00       	mov    $0x4,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <read>:
SYSCALL(read)
 3f2:	b8 05 00 00 00       	mov    $0x5,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <write>:
SYSCALL(write)
 3fa:	b8 10 00 00 00       	mov    $0x10,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <close>:
SYSCALL(close)
 402:	b8 15 00 00 00       	mov    $0x15,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <kill>:
SYSCALL(kill)
 40a:	b8 06 00 00 00       	mov    $0x6,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <exec>:
SYSCALL(exec)
 412:	b8 07 00 00 00       	mov    $0x7,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <open>:
SYSCALL(open)
 41a:	b8 0f 00 00 00       	mov    $0xf,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <mknod>:
SYSCALL(mknod)
 422:	b8 11 00 00 00       	mov    $0x11,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <unlink>:
SYSCALL(unlink)
 42a:	b8 12 00 00 00       	mov    $0x12,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <fstat>:
SYSCALL(fstat)
 432:	b8 08 00 00 00       	mov    $0x8,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <link>:
SYSCALL(link)
 43a:	b8 13 00 00 00       	mov    $0x13,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <mkdir>:
SYSCALL(mkdir)
 442:	b8 14 00 00 00       	mov    $0x14,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <chdir>:
SYSCALL(chdir)
 44a:	b8 09 00 00 00       	mov    $0x9,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <dup>:
SYSCALL(dup)
 452:	b8 0a 00 00 00       	mov    $0xa,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <getpid>:
SYSCALL(getpid)
 45a:	b8 0b 00 00 00       	mov    $0xb,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <sbrk>:
SYSCALL(sbrk)
 462:	b8 0c 00 00 00       	mov    $0xc,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sleep>:
SYSCALL(sleep)
 46a:	b8 0d 00 00 00       	mov    $0xd,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <uptime>:
SYSCALL(uptime)
 472:	b8 0e 00 00 00       	mov    $0xe,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    
 47a:	66 90                	xchg   %ax,%ax
 47c:	66 90                	xchg   %ax,%ax
 47e:	66 90                	xchg   %ax,%ax

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 489:	85 d2                	test   %edx,%edx
{
 48b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 48e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 490:	79 76                	jns    508 <printint+0x88>
 492:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 496:	74 70                	je     508 <printint+0x88>
    x = -xx;
 498:	f7 d8                	neg    %eax
    neg = 1;
 49a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4a1:	31 f6                	xor    %esi,%esi
 4a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4a6:	eb 0a                	jmp    4b2 <printint+0x32>
 4a8:	90                   	nop
 4a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	89 fe                	mov    %edi,%esi
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	8d 7e 01             	lea    0x1(%esi),%edi
 4b7:	f7 f1                	div    %ecx
 4b9:	0f b6 92 04 09 00 00 	movzbl 0x904(%edx),%edx
  }while((x /= base) != 0);
 4c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 4c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 4c5:	75 e9                	jne    4b0 <printint+0x30>
  if(neg)
 4c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 4ca:	85 c0                	test   %eax,%eax
 4cc:	74 08                	je     4d6 <printint+0x56>
    buf[i++] = '-';
 4ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 4d3:	8d 7e 02             	lea    0x2(%esi),%edi
 4d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 4da:	8b 7d c0             	mov    -0x40(%ebp),%edi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
 4e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 4e3:	83 ec 04             	sub    $0x4,%esp
 4e6:	83 ee 01             	sub    $0x1,%esi
 4e9:	6a 01                	push   $0x1
 4eb:	53                   	push   %ebx
 4ec:	57                   	push   %edi
 4ed:	88 45 d7             	mov    %al,-0x29(%ebp)
 4f0:	e8 05 ff ff ff       	call   3fa <write>

  while(--i >= 0)
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	39 de                	cmp    %ebx,%esi
 4fa:	75 e4                	jne    4e0 <printint+0x60>
    putc(fd, buf[i]);
}
 4fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ff:	5b                   	pop    %ebx
 500:	5e                   	pop    %esi
 501:	5f                   	pop    %edi
 502:	5d                   	pop    %ebp
 503:	c3                   	ret    
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 508:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 50f:	eb 90                	jmp    4a1 <printint+0x21>
 511:	eb 0d                	jmp    520 <printf>
 513:	90                   	nop
 514:	90                   	nop
 515:	90                   	nop
 516:	90                   	nop
 517:	90                   	nop
 518:	90                   	nop
 519:	90                   	nop
 51a:	90                   	nop
 51b:	90                   	nop
 51c:	90                   	nop
 51d:	90                   	nop
 51e:	90                   	nop
 51f:	90                   	nop

00000520 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 529:	8b 75 0c             	mov    0xc(%ebp),%esi
 52c:	0f b6 1e             	movzbl (%esi),%ebx
 52f:	84 db                	test   %bl,%bl
 531:	0f 84 b3 00 00 00    	je     5ea <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 537:	8d 45 10             	lea    0x10(%ebp),%eax
 53a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 53d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 53f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 542:	eb 2f                	jmp    573 <printf+0x53>
 544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	0f 84 a7 00 00 00    	je     5f8 <printf+0xd8>
  write(fd, &c, 1);
 551:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 554:	83 ec 04             	sub    $0x4,%esp
 557:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 55a:	6a 01                	push   $0x1
 55c:	50                   	push   %eax
 55d:	ff 75 08             	pushl  0x8(%ebp)
 560:	e8 95 fe ff ff       	call   3fa <write>
 565:	83 c4 10             	add    $0x10,%esp
 568:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 56b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 56f:	84 db                	test   %bl,%bl
 571:	74 77                	je     5ea <printf+0xca>
    if(state == 0){
 573:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 575:	0f be cb             	movsbl %bl,%ecx
 578:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 57b:	74 cb                	je     548 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 57d:	83 ff 25             	cmp    $0x25,%edi
 580:	75 e6                	jne    568 <printf+0x48>
      if(c == 'd'){
 582:	83 f8 64             	cmp    $0x64,%eax
 585:	0f 84 05 01 00 00    	je     690 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 58b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 591:	83 f9 70             	cmp    $0x70,%ecx
 594:	74 72                	je     608 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 596:	83 f8 73             	cmp    $0x73,%eax
 599:	0f 84 99 00 00 00    	je     638 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59f:	83 f8 63             	cmp    $0x63,%eax
 5a2:	0f 84 08 01 00 00    	je     6b0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	0f 84 ef 00 00 00    	je     6a0 <printf+0x180>
  write(fd, &c, 1);
 5b1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5b4:	83 ec 04             	sub    $0x4,%esp
 5b7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5bb:	6a 01                	push   $0x1
 5bd:	50                   	push   %eax
 5be:	ff 75 08             	pushl  0x8(%ebp)
 5c1:	e8 34 fe ff ff       	call   3fa <write>
 5c6:	83 c4 0c             	add    $0xc,%esp
 5c9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5cc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 5cf:	6a 01                	push   $0x1
 5d1:	50                   	push   %eax
 5d2:	ff 75 08             	pushl  0x8(%ebp)
 5d5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 5da:	e8 1b fe ff ff       	call   3fa <write>
  for(i = 0; fmt[i]; i++){
 5df:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 5e3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5e6:	84 db                	test   %bl,%bl
 5e8:	75 89                	jne    573 <printf+0x53>
    }
  }
}
 5ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5ed:	5b                   	pop    %ebx
 5ee:	5e                   	pop    %esi
 5ef:	5f                   	pop    %edi
 5f0:	5d                   	pop    %ebp
 5f1:	c3                   	ret    
 5f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 5f8:	bf 25 00 00 00       	mov    $0x25,%edi
 5fd:	e9 66 ff ff ff       	jmp    568 <printf+0x48>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 608:	83 ec 0c             	sub    $0xc,%esp
 60b:	b9 10 00 00 00       	mov    $0x10,%ecx
 610:	6a 00                	push   $0x0
 612:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 615:	8b 45 08             	mov    0x8(%ebp),%eax
 618:	8b 17                	mov    (%edi),%edx
 61a:	e8 61 fe ff ff       	call   480 <printint>
        ap++;
 61f:	89 f8                	mov    %edi,%eax
 621:	83 c4 10             	add    $0x10,%esp
      state = 0;
 624:	31 ff                	xor    %edi,%edi
        ap++;
 626:	83 c0 04             	add    $0x4,%eax
 629:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 62c:	e9 37 ff ff ff       	jmp    568 <printf+0x48>
 631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 638:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 63b:	8b 08                	mov    (%eax),%ecx
        ap++;
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 643:	85 c9                	test   %ecx,%ecx
 645:	0f 84 8e 00 00 00    	je     6d9 <printf+0x1b9>
        while(*s != 0){
 64b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 64e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 650:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 652:	84 c0                	test   %al,%al
 654:	0f 84 0e ff ff ff    	je     568 <printf+0x48>
 65a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 65d:	89 de                	mov    %ebx,%esi
 65f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 662:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 665:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 668:	83 ec 04             	sub    $0x4,%esp
          s++;
 66b:	83 c6 01             	add    $0x1,%esi
 66e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 671:	6a 01                	push   $0x1
 673:	57                   	push   %edi
 674:	53                   	push   %ebx
 675:	e8 80 fd ff ff       	call   3fa <write>
        while(*s != 0){
 67a:	0f b6 06             	movzbl (%esi),%eax
 67d:	83 c4 10             	add    $0x10,%esp
 680:	84 c0                	test   %al,%al
 682:	75 e4                	jne    668 <printf+0x148>
 684:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 687:	31 ff                	xor    %edi,%edi
 689:	e9 da fe ff ff       	jmp    568 <printf+0x48>
 68e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 0a 00 00 00       	mov    $0xa,%ecx
 698:	6a 01                	push   $0x1
 69a:	e9 73 ff ff ff       	jmp    612 <printf+0xf2>
 69f:	90                   	nop
  write(fd, &c, 1);
 6a0:	83 ec 04             	sub    $0x4,%esp
 6a3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6a6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6a9:	6a 01                	push   $0x1
 6ab:	e9 21 ff ff ff       	jmp    5d1 <printf+0xb1>
        putc(fd, *ap);
 6b0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 6b3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6b6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
        ap++;
 6ba:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 6bd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 6c0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6c3:	50                   	push   %eax
 6c4:	ff 75 08             	pushl  0x8(%ebp)
 6c7:	e8 2e fd ff ff       	call   3fa <write>
        ap++;
 6cc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6cf:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6d2:	31 ff                	xor    %edi,%edi
 6d4:	e9 8f fe ff ff       	jmp    568 <printf+0x48>
          s = "(null)";
 6d9:	bb fc 08 00 00       	mov    $0x8fc,%ebx
        while(*s != 0){
 6de:	b8 28 00 00 00       	mov    $0x28,%eax
 6e3:	e9 72 ff ff ff       	jmp    65a <printf+0x13a>
 6e8:	66 90                	xchg   %ax,%ax
 6ea:	66 90                	xchg   %ax,%ax
 6ec:	66 90                	xchg   %ax,%ax
 6ee:	66 90                	xchg   %ax,%ax

000006f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	a1 0c 0c 00 00       	mov    0xc0c,%eax
{
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 708:	39 c8                	cmp    %ecx,%eax
 70a:	8b 10                	mov    (%eax),%edx
 70c:	73 32                	jae    740 <free+0x50>
 70e:	39 d1                	cmp    %edx,%ecx
 710:	72 04                	jb     716 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 712:	39 d0                	cmp    %edx,%eax
 714:	72 32                	jb     748 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 716:	8b 73 fc             	mov    -0x4(%ebx),%esi
 719:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71c:	39 fa                	cmp    %edi,%edx
 71e:	74 30                	je     750 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 720:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 723:	8b 50 04             	mov    0x4(%eax),%edx
 726:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 729:	39 f1                	cmp    %esi,%ecx
 72b:	74 3a                	je     767 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 72d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 72f:	a3 0c 0c 00 00       	mov    %eax,0xc0c
}
 734:	5b                   	pop    %ebx
 735:	5e                   	pop    %esi
 736:	5f                   	pop    %edi
 737:	5d                   	pop    %ebp
 738:	c3                   	ret    
 739:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	39 d0                	cmp    %edx,%eax
 742:	72 04                	jb     748 <free+0x58>
 744:	39 d1                	cmp    %edx,%ecx
 746:	72 ce                	jb     716 <free+0x26>
{
 748:	89 d0                	mov    %edx,%eax
 74a:	eb bc                	jmp    708 <free+0x18>
 74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 750:	03 72 04             	add    0x4(%edx),%esi
 753:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 756:	8b 10                	mov    (%eax),%edx
 758:	8b 12                	mov    (%edx),%edx
 75a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 50 04             	mov    0x4(%eax),%edx
 760:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 763:	39 f1                	cmp    %esi,%ecx
 765:	75 c6                	jne    72d <free+0x3d>
    p->s.size += bp->s.size;
 767:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 76a:	a3 0c 0c 00 00       	mov    %eax,0xc0c
    p->s.size += bp->s.size;
 76f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 772:	8b 53 f8             	mov    -0x8(%ebx),%edx
 775:	89 10                	mov    %edx,(%eax)
}
 777:	5b                   	pop    %ebx
 778:	5e                   	pop    %esi
 779:	5f                   	pop    %edi
 77a:	5d                   	pop    %ebp
 77b:	c3                   	ret    
 77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000780 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 789:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 78c:	8b 15 0c 0c 00 00    	mov    0xc0c,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 9d 00 00 00    	je     840 <malloc+0xc0>
 7a3:	8b 02                	mov    (%edx),%eax
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7a8:	39 cf                	cmp    %ecx,%edi
 7aa:	76 6c                	jbe    818 <malloc+0x98>
 7ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7b2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7b7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 7ba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 7c1:	eb 0e                	jmp    7d1 <malloc+0x51>
 7c3:	90                   	nop
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ca:	8b 48 04             	mov    0x4(%eax),%ecx
 7cd:	39 f9                	cmp    %edi,%ecx
 7cf:	73 47                	jae    818 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7d1:	39 05 0c 0c 00 00    	cmp    %eax,0xc0c
 7d7:	89 c2                	mov    %eax,%edx
 7d9:	75 ed                	jne    7c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7db:	83 ec 0c             	sub    $0xc,%esp
 7de:	56                   	push   %esi
 7df:	e8 7e fc ff ff       	call   462 <sbrk>
  if(p == (char*)-1)
 7e4:	83 c4 10             	add    $0x10,%esp
 7e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ea:	74 1c                	je     808 <malloc+0x88>
  hp->s.size = nu;
 7ec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	83 c0 08             	add    $0x8,%eax
 7f5:	50                   	push   %eax
 7f6:	e8 f5 fe ff ff       	call   6f0 <free>
  return freep;
 7fb:	8b 15 0c 0c 00 00    	mov    0xc0c,%edx
      if((p = morecore(nunits)) == 0)
 801:	83 c4 10             	add    $0x10,%esp
 804:	85 d2                	test   %edx,%edx
 806:	75 c0                	jne    7c8 <malloc+0x48>
        return 0;
  }
}
 808:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 80b:	31 c0                	xor    %eax,%eax
}
 80d:	5b                   	pop    %ebx
 80e:	5e                   	pop    %esi
 80f:	5f                   	pop    %edi
 810:	5d                   	pop    %ebp
 811:	c3                   	ret    
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 818:	39 cf                	cmp    %ecx,%edi
 81a:	74 54                	je     870 <malloc+0xf0>
        p->s.size -= nunits;
 81c:	29 f9                	sub    %edi,%ecx
 81e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 821:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 824:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 827:	89 15 0c 0c 00 00    	mov    %edx,0xc0c
}
 82d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 830:	83 c0 08             	add    $0x8,%eax
}
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    
 838:	90                   	nop
 839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 840:	c7 05 0c 0c 00 00 10 	movl   $0xc10,0xc0c
 847:	0c 00 00 
 84a:	c7 05 10 0c 00 00 10 	movl   $0xc10,0xc10
 851:	0c 00 00 
    base.s.size = 0;
 854:	b8 10 0c 00 00       	mov    $0xc10,%eax
 859:	c7 05 14 0c 00 00 00 	movl   $0x0,0xc14
 860:	00 00 00 
 863:	e9 44 ff ff ff       	jmp    7ac <malloc+0x2c>
 868:	90                   	nop
 869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 870:	8b 08                	mov    (%eax),%ecx
 872:	89 0a                	mov    %ecx,(%edx)
 874:	eb b1                	jmp    827 <malloc+0xa7>
