/*
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
import webViewOnRequestStart from './webViewOnRequestStart.test';
import webViewOnRequestStartTwo from './webViewOnRequestStartTwo.test';
import webViewOnRequestStop from './webViewOnRequestStop.test';
import WebSchemeHandlerResponse from './WebSchemeHandlerResponse.test';
import WebHttpBodyStream from './WebHttpBodyStream.test';
import setAndClearWebSchemeHandler from './setAndClearWebSchemeHandler.test';
import setAndClearServiceWorkerWebSchemeHandler from './setAndClearServiceWorkerWebSchemeHandler.test';
import customizeSchemes from './customizeSchemes.test';
import WebNetError from './WebNetError.test';
import webViewGetRequestResourceType from './webViewGetRequestResourceType.test';


export default function testsuite() {
       webViewGetRequestResourceType()
       webViewOnRequestStart()
       webViewOnRequestStartTwo()
       webViewOnRequestStop()
       WebSchemeHandlerResponse()
       WebHttpBodyStream()
       setAndClearWebSchemeHandler()
       setAndClearServiceWorkerWebSchemeHandler()
       customizeSchemes()
       WebNetError()
}