/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import progressUndefined from './ProgressTest/progressUndefined.test';
import progressModifierUndefined from './ProgressTest/progressModifierUndefined.test';
import timePickerUndefined from './TimePickerTest/timePickerUndefined.test';
import timePickerModifierUndefined from './TimePickerTest/timePickerModifierUndefined.test';
import DataPanelUndefinedTest from './DataPanelTest/dataPanelUndefined.test'
import DataPanelAttrsModifierUndefinedTest from './DataPanelTest/dataPanelAttrsModifierUndefined.test'
import GaugeUndefinedTest from './GaugeTest/gaugeUndefined.test';
import GaugeAttrsModifierUndefinedTest from './GaugeTest/gaugeAttrsModifierUndefined.test';
import ImageUndefinedTest from './ImageTest/imageUndefined.test';
import ImageAttrsModifierUndefinedTest from './ImageTest/imageAttrsModifierUndefined.test';
import ImageOnfinishUndefinedTest from './ImageTest/imageOnfinishUndefined.test';
import ImageAttrsModifierOnfinishUndefinedTest from './ImageTest/imageAttrsModifierOnfinishUndefined.test';
import ImageOnErrorUndefinedTest from './ImageTest/imageOnErrorUndefined.test';
import ImageAttrsModifierOnErrorUndefinedTest from './ImageTest/imageAttrsModifierOnErrorUndefined.test';
export default function testsuite() {
  progressUndefined()
  timePickerUndefined()
  progressModifierUndefined()
  timePickerModifierUndefined()
  DataPanelUndefinedTest();
  DataPanelAttrsModifierUndefinedTest();
  GaugeUndefinedTest();
  GaugeAttrsModifierUndefinedTest();
  ImageUndefinedTest();
  ImageAttrsModifierUndefinedTest();
  ImageOnfinishUndefinedTest();
  ImageAttrsModifierOnfinishUndefinedTest();
  ImageOnErrorUndefinedTest();
  ImageAttrsModifierOnErrorUndefinedTest();
}
