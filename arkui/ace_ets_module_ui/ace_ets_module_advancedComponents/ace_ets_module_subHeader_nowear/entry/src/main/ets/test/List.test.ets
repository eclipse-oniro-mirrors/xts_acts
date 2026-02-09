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

import subHeaderButton from './api12/subHeaderButton.test';
import subHeaderIconGroup from './api12/subHeaderIconGroup.test';
import subHeaderTextArrow from './api12/subHeaderTextArrow.test';
import subheaderTitleBuilder from './api12/subheaderTitleBuilder.test';
import subHeaderSelect from './api12/subHeaderSelect.test';
import subHeaderTitleModifier from './api12/subHeaderTitleModifier.test';
import subHeaderSelect18 from './api18/subHeaderSelect18.test';
import subHeader23 from './api23/subHeader23.test';

export default function testsuite() {
  subHeaderButton();
  subHeaderIconGroup();
  subHeaderTextArrow();
  subheaderTitleBuilder();
  subHeaderSelect();
  subHeaderTitleModifier();
  subHeaderSelect18();
  subHeader23();
}