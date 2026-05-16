/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ACTSMINDSPORECTEST_ACTS_MINDSPORE_H
#define ACTSMINDSPORECTEST_ACTS_MINDSPORE_H

#ifndef OH_AI_STATUS_LITE_MODEL_REBUILD
#define OH_AI_STATUS_LITE_MODEL_REBUILD (OH_AI_COMPCODE_LITE | (0x0FFFFFFF & -12))
#endif // OH_AI_STATUS_LITE_MODEL_REBUILD

// Include all module headers
#include "ActsMindSporeCommonTest.h"
#include "ActsMindSporeContextTest.h"
#include "ActsMindSporeModelTest.h"
#include "ActsMindSporeNNRTTest.h"
#include "ActsMindSporeOHOSTest.h"
#include "ActsMindSporeTensorTest.h"
#include "ActsMindSporeTrainTest.h"
#include "ActsMindSporeAIPPTest.h"

#endif // ACTSMINDSPORECTEST_ACTS_MINDSPORE_H
