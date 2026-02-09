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
import SegmentButtonTest003 from './segmenButton/SegmentButtonTest003.test';
import SegmentButtonTest004 from './segmenButton/SegmentButtonTest004.test';
import SegmentButtonTest005 from './segmenButton/SegmentButtonTest005.test';
import SegBtnItemTest0010 from './segmenButton/SegBtnItemTest0010.test';

export default function testsuite() {
  SegmentButtonTest003();
  SegmentButtonTest004();
  SegmentButtonTest005();
  SegBtnItemTest0010();
}