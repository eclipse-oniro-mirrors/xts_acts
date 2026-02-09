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
import AppStorageJsunit from './AppStorageTest/AppStorageJsunit.test';
import systemAppJsunit from './AppStorageTest/SystemAppJsunit.test';
import basicJsunit from './BasicTest/BasicJsunit.test';

import configurationJsunit from './configuration/ConfigurationJsunit.test';
import globalJsunit1 from './globalTest/global1.test';

import ResourceColor from './ResourceTest/ResourceColor.test'
import ResourceFloat from './ResourceTest/ResourceFloat.test'
import ResourceInteger from './ResourceTest/ResourceInteger.test'
import ResourcePlural from './ResourceTest/ResourcePlural.test'
import ResourceStrarray from './ResourceTest/ResourceStrarray.test'
import ResourceString from './ResourceTest/ResourceString.test'

import webEditTextJsunit from './webTest/web.test';
import web9Jsunit from './webTest/Web9Jsunit.test'
import webJsunit from './webTest/WebJsunitApi9.test'
import webViewPageattrLackJsunit from './webTest/webviewPageLackattr.test'

export default function testsuite() {
   AppStorageJsunit();
   basicJsunit();
   globalJsunit1();
   ResourceColor();
   ResourceFloat();
   ResourceInteger();
   ResourcePlural();
   ResourceStrarray();
  ResourceString();
}
