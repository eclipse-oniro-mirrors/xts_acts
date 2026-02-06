/**
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

import webViewOnErrorReceive02Jsunit from './WebViewOnErrorReceive02Jsunit.test'
import webViewOnErrorReceive03Jsunit from './WebViewOnErrorReceive03Jsunit.test'
import webViewONHttpErrorReceive from './webViewONHttpErrorReceive.test'
import webViewONHttpErrorReceiveExample from './webViewONHttpErrorReceiveExample.test'
import webViewONHttpErrorRecvExampleIsReady from './webViewONHttpErrorRecvExampleIsReady.test'
import webViewONHttpErrorReceiveIframe from './webViewONHttpErrorReceiveIframe.test'
import webViewONHttpErrorReceiveString from './webViewONHttpErrorReceiveString.test'
import webViewONHttpErrorReceiveNumber from './webViewONHttpErrorReceiveNumber.test'

export default function testsuite() {
       webViewOnErrorReceive02Jsunit()
       webViewONHttpErrorReceive()
       webViewONHttpErrorReceiveExample()
       webViewONHttpErrorRecvExampleIsReady()
       webViewONHttpErrorReceiveIframe()
       webViewONHttpErrorReceiveString()
       webViewONHttpErrorReceiveNumber()
       webViewOnErrorReceive03Jsunit()
}