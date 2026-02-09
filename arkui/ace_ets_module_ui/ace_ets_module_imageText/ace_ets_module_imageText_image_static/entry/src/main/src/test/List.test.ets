'use static';
/**
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

import blendNodeTest from './BlendModeTest/blendNodeTest.test';
import getUIContextApiTest from './imageTest/getUIContextApi.test';
import ImageAlt22Test from './imageTest/ImageAlt22.test';
import ImageContentTransitionTest from './imageTest/ImageContentTransition.test';
import ImageSupportSvg2Test from './imageTest/ImageSupportSvg2.test';
import AnimationControllerTest from './drawableDescriptorTest/AnimationController.test';
import ImageAnimationControllerERRORTest from './drawableDescriptorTest/AnimationControllerERROR.test';
import ImageLoaderTest from './ImageLoader/ImageLoader.test';
import ImageOrientationTest from './imageTest/ImageOrientationTest.test';
import ImageHdrBrightnessTest from './imageTest/ImageHdrBrightness.test';
export default function testsuite() {
  blendNodeTest();
  getUIContextApiTest();
  ImageAlt22Test();
  ImageContentTransitionTest();
  ImageSupportSvg2Test();
  AnimationControllerTest();
  ImageAnimationControllerERRORTest();
  ImageLoaderTest();
  ImageOrientationTest();
  ImageHdrBrightnessTest();
}