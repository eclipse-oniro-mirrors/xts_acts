/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import swiperFillPolicy from './swiper/swiperFillPolicy.test';
import SwiperParamExample from './swiper/SwiperParamExample.test';
import TabsExample1 from './tabs/TabsExample1.test';
import TabsExample2 from './tabs/TabsExample2.test';
import ArcSwiperControllerFinishAnimationNullTest from './arcSwiper/ArcSwiperControllerFinishAnimationNull.test';
import ArcDotIndicatorNullUndefinedTest from './arcSwiper/ArcDotIndicatorNullUndefined.test';
import ArcSwiperAttributeUndefinedTest from './arcSwiper/ArcSwiperAttributeUndefined.test';
import ArcSwiperAttributeNullTest from './arcSwiper/ArcSwiperAttributeNull.test';
import SwiperFakeDragTest from './swiper/SwiperFakeDragTest.test';
import SwiperAttributeNullUndefined from './SwiperAttributeNullUndefined/SwiperAttributeNullUndefined.test';
import DigitIndicatorNullUndefined from './SwiperAttributeNullUndefined/DigitIndicatorNullUndefined.test';
import DotIndicatorNullUndefined from './SwiperAttributeNullUndefined/DotIndicatorNullUndefined.test';
import swiperCachedOptions from './swiper/swiperCachedOptions.test';

export default function testsuite() {
  swiperFillPolicy()
  SwiperParamExample()
  TabsExample1()
  TabsExample2()
  ArcSwiperControllerFinishAnimationNullTest()
  ArcDotIndicatorNullUndefinedTest()
  ArcSwiperAttributeNullTest()
  ArcSwiperAttributeUndefinedTest()
  SwiperFakeDragTest()
  SwiperAttributeNullUndefined()
  DigitIndicatorNullUndefined()
  DotIndicatorNullUndefined()
  swiperCachedOptions()
}