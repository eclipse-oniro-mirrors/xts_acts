/*
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import swiperIndex from './Swiper/Swiper_ParmsChange/swiperIndex.test.ets';
import swiperVertical from './Swiper/Swiper_ParmsChange/swiperVertical.test.ets';
import swiperLoopTrue from './Swiper/Swiper_ParmsChange/swiperLoopTrue.test.ets';
import swiperLoopFalse from './Swiper/Swiper_ParmsChange/swiperLoopFalse.test.ets';

import swiperItemSpace from './Swiper/Swiper_ParmsChange/swiperItemSpace.test.ets';
import swiperPadding from './Swiper/Swiper_ParmsChange/swiperPadding.test.ets';
import swiperMargin from './Swiper/Swiper_ParmsChange/swiperMargin.test.ets';
import swiperMarPad from './Swiper/Swiper_ParmsChange/swiperMarPad.test.ets';
import swiperDisableSwipeTrue from './Swiper/Swiper_ParmsChange/swiperDisableSwipeTrue.test.ets';
import swiperDisableSwipeFalse from './Swiper/Swiper_ParmsChange/swiperDisableSwipeFalse.test.ets';
import swiperItemSize from './Swiper/Swiper_ItemChange/swiperItemSize.test.ets';
import swiperItemSize2 from './Swiper/Swiper_ItemChange/swiperItemSize2.test.ets';
import swiperItemPadding from './Swiper/Swiper_ItemChange/swiperItemPadding.test.ets';
import swiperItemMargin from './Swiper/Swiper_ItemChange/swiperItemMargin.test.ets';
import swiperItemPadMar from './Swiper/Swiper_ItemChange/swiperItemPadMar.test.ets';
import swiperItemVisibility from './Swiper/Swiper_ItemChange/swiperItemVisibility.test.ets';

export default function testsuite() {
 
swiperIndex()
swiperVertical()
swiperLoopTrue()
swiperLoopFalse()
swiperItemSpace()
swiperPadding()
swiperMargin()
swiperMarPad()
swiperDisableSwipeTrue()
swiperDisableSwipeFalse()
swiperItemSize()
swiperItemSize2()
swiperItemPadding()
swiperItemMargin()
swiperItemPadMar()
swiperItemVisibility()

}