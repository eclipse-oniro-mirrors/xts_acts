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

import PopupAJsunit from './Dialog/PopupJsunit.test.ets';
import bindPopupJsunit from './MenuTest/BindPopupJsunit.test.ets';
import bindPopupOffsetTest from './promptActionTest/bindPopupOffset.test'
import arrowOffset from './popup/arrowOffset.test';
import isVisible from './popup/isVisible.test';
import bindTips1Test from './bindTipsTest/bindTipsTest1.test';
import bindTips2Test from './bindTipsTest/bindTipsTest2.test';

export default function testsuite() {
  PopupAJsunit();
  bindPopupJsunit();
  bindPopupOffsetTest();
  arrowOffset();
  isVisible();
  bindTips1Test();
  bindTips2Test();
























	
}