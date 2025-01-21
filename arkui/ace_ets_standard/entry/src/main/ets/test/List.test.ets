/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import badgeJsunit from './BadgeJsunit.test';
import dividerJsunit from './DividerJsunit.test';
import buttonJsunit from './ButtonJsunit.test';
import blankJsunit from './BlankJsunit.test';
import datapanelJsunit from './DataPanelJsunit.test';
import textJsunit from './TextJsunit.test';
import rowSplitJsunit from './RowSplitJsunit.test';
import ScrollJsunit from './ScrollJsunit.test';
import StackJsunit from './StackJsunit.test';
import imageJsunit from './ImageJsunit.test';
import progressJsunit from './ProgressJsunit.test';
import qrcodeJsunit from './QrcodeJsunit.test';
import ratingJsunit from './RatingJsunit.test';
import spanJsunit from './SpanJsunit.test';
import sliderJsunit from './SliderJsunit.test';
import gridContainerJsunit from './GridContainerJsunit.test';
import flexJsunit from './FlexJsunit.test';
import counterJsunit from './CounterJsunit.test';
import columnSplitJsunit from './ColumnSplitJsunit.test';
import columnJsunit from './ColumnJsunit.test';

export default function testsuite() {
  buttonJsunit()
  blankJsunit()
  datapanelJsunit()
  dividerJsunit()
  textJsunit()
  rowSplitJsunit()
  ScrollJsunit()
  StackJsunit()
  imageJsunit()
  progressJsunit()
  qrcodeJsunit()
  ratingJsunit()
  spanJsunit()
  sliderJsunit()
  badgeJsunit()
  columnJsunit()
  columnSplitJsunit()
  counterJsunit()
  flexJsunit()
  gridContainerJsunit()
}