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

import globalJsunit from './globalTest/GlobalJsunit.test';
import ResourceColor from './ResourceTest/ResourceColor.test.ets'
import ResourceFloat from './ResourceTest/ResourceFloat.test.ets'
import ResourceInteger from './ResourceTest/ResourceInteger.test.ets'
import ResourcePlural from './ResourceTest/ResourcePlural.test.ets'
import ResourceStrarray from './ResourceTest/ResourceStrarray.test.ets'
import ResourceString from './ResourceTest/ResourceString.test.ets'

import appStorageJsunit from './AppStorageTest/AppStorageJsunit.test';
import basicJsunit from './BasicTest/BasicJsunit.test';
import systemAppJsunit from './AppStorageTest/SystemAppJsunit.test';
import webEditTextJsunit from './webTest/web.test.ets';

import globalJsunit1 from './globalTest/global1.test';
import webGetTitleJsunit from './webTest/web2.test';
import configurationJsunit from './configuration/ConfigurationJsunit.test.ets';

export default function testsuite() {
  globalJsunit();
  ResourceColor();
  ResourceFloat();
  ResourceInteger();
  ResourcePlural();
  ResourceStrarray();
  ResourceString();
  appStorageJsunit()
  basicJsunit()
  systemAppJsunit()
  webEditTextJsunit()
  globalJsunit1()
  webGetTitleJsunit()
  configurationJsunit();
}