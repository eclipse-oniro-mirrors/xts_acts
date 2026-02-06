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

import refreshJsunit from './Refresh/RefreshJsunit.test';
import RefreshUxTest from './Refresh/refreshUx.test';
import refreshOffsetJsunit from './Refresh/refreshOffsetJsunit.test';
import refreshOffsetChangeJsunit from './Refresh/refreshOffsetChangeJsunit.test';
import refreshResource from './Refresh/refreshResource.test';
import refreshString from './Refresh/refreshString.test';
import RefreshingContent from './Refresh/RefreshingContent.test';
import maxDownRefresh from './Refresh/maxDownRefresh.test';
import pullUpToCancelRefresh from './Refresh/pullUpToCancelRefresh.test';
import pullUpToCancelRefreshModifier from './Refresh/pullUpToCancelRefreshModifier.test';


export default function testsuite() {
  refreshJsunit()
  RefreshUxTest()
  refreshOffsetJsunit()
  refreshOffsetChangeJsunit()
  refreshResource()
  refreshString()
  RefreshingContent()
  maxDownRefresh()
  pullUpToCancelRefresh()
  pullUpToCancelRefreshModifier()
}