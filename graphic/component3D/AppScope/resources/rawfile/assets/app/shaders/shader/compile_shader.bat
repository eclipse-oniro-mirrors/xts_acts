 @rem Copyright (c) 2024 Huawei Device Co., Ltd.
 @rem Licensed under the Apache License, Version 2.0 (the "License");
 @rem you may not use this file except in compliance with the License.
 @rem You may obtain a copy of the License at
 @rem
 @rem     http://www.apache.org/licenses/LICENSE-2.0
 @rem
 @rem Unless required by applicable law or agreed to in writing, software
 @rem distributed under the License is distributed on an "AS IS" BASIS,
 @rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 @rem See the License for the specific language governing permissions and
 @rem limitations under the License.
 @echo off

wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.frag.spv .
wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.frag.spv.gl .
wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.frag.spv.gles .
wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.frag.spv.lsb .
wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.frag.spv.pre .

@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.vert.spv .
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.vert.spv.gl .
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.vert.spv.gles .
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.vert.spv.lsb .
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/foundation/graphic/graphic_3d/lume/Lume_3D/assets/3d/shaders/shader/London.vert.spv.pre .
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/out/rk3568/arkui/ace_engine/libace.z.so ./lib
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/out/rk3568/arkui/ace_engine/libace_compatible.z.so ./lib
@rem wsl.exe rsync -azP -e 'ssh -p 2222' huxiaoming@123.60.114.129:~/OHOS_20231204/out/rk3568/graphic/graphic_3d/lib3dWidgetAdapter.z.so ./lib

pause
