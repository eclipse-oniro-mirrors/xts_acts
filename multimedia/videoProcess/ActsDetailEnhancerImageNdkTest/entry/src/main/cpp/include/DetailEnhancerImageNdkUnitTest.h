/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef DETAIL_ENHANCER_IMAGE_TEST_H
#define DETAIL_ENHANCER_IMAGE_TEST_H

namespace OHOS {
namespace Media {
namespace VideoProcessingEngine {

// initialize environment
int VpeImageNdk01();

// initialize and de-initialize
int VpeImageNdk02();

// de-initialize without initialize
int VpeImageNdk03();

// create instance
int VpeImageNdk04();

// create instance with wrong type
int VpeImageNdk05();

// destroy instance
int VpeImageNdk06();

// destroy null instance
int VpeImageNdk07();

// set parameter normally
int VpeImageNdk08();

// set parameter with null
int VpeImageNdk09();

// set parameter but instance is null
int VpeImageNdk10();

// get parameter after set parameter
int VpeImageNdk11();

// get parameter after set parameter: level none
int VpeImageNdk112();

// get parameter after set parameter: level low
int VpeImageNdk113();

// get parameter after set parameter: level medium
int VpeImageNdk114();

// get parameter after set parameter: invalid param
int VpeImageNdk115();

// get parameter but parameter is null
int VpeImageNdk12();

// get parameter but instance is null set
int VpeImageNdk13();

// get parameter but parameter is not null
int VpeImageNdk14();

// colorspaceconversion support check 1
int VpeImageNdk15();

// colorspaceconversion support check 2
int VpeImageNdk16();

// colorspaceconversion support check 3
int VpeImageNdk17();

// colorspaceconversion support check 4
int VpeImageNdk18();

// conposition support check 1
int VpeImageNdk19();

// conposition support check 2
int VpeImageNdk20();

// conposition support check 3
int VpeImageNdk21();

// deconposition support check 1
int VpeImageNdk22();

// deconposition support check 2
int VpeImageNdk23();

// deconposition support check 3
int VpeImageNdk24();

// metadata generation support check 1
int VpeImageNdk25();

// metadata generation support check 2
int VpeImageNdk26();

// metadata generation support check 3
int VpeImageNdk27();

// metadata generation support check 4
int VpeImageNdk28();

// convert color space RGBA to BGRA impl
int VpeImageNdk29();

// convert color space BGRA to RGBA impl
int VpeImageNdk30();

// convert color space nullptr
int VpeImageNdk31();

// compose RGBA impl
int VpeImageNdk32();

// compose BGRA impl
int VpeImageNdk33();

// compose nullptr
int VpeImageNdk34();

// decompose RGBA impl
int VpeImageNdk35();

// decompose BGRA impl
int VpeImageNdk36();

// decompose nullptr
int VpeImageNdk37();

// generate metadata RGBA impl
int VpeImageNdk38();

// generate metadata BGRA impl
int VpeImageNdk39();

// generate metadata nullptr
int VpeImageNdk40();

// detail enhance RGBA
int VpeImageNdk41();

// detail enhance BGRA
int VpeImageNdk42();

// detail enhance nullptr
int VpeImageNdk43();

// DeinitializeEnvironment without initialization
int VpeImageNdk44();

// invalid parameter to create
int VpeImageNdk45();

// invalid instance to create
int VpeImageNdk46();

// invalid instance to destroy
int VpeImageNdk47();

} // namespace VideoProcessingEngine
} // namespace Media
} // namespace OHOS

#endif // DETAIL_ENHANCER_IMAGE_TEST_H

