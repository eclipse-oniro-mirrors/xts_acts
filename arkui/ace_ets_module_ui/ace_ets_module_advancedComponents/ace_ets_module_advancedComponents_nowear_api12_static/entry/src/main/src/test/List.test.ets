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

import splitLayoutTest from './splitLayout/splitLayoutTest.test';
import swipeRefresherPageTest from './swipeRefresher/swipeRefresherPageTest.test';
import treeViewNodeParamContainer from './treeView/treeViewNodeParamContainer.test';
import treeViewSymbol from './treeView/treeViewSymbol.test';
import subHeaderButton from './subHeader/subHeaderButton.test';
import subHeaderIconGroup from './subHeader/subHeaderIconGroup.test';
import subHeaderSelect from './subHeader/subHeaderSelect.test';
import popupDirectionTest from './popup/popupDirectionTest.test';

export default function testsuite() {
  popupDirectionTest();
  splitLayoutTest();
  swipeRefresherPageTest();
  subHeaderButton();
  subHeaderIconGroup();
  subHeaderSelect();
}