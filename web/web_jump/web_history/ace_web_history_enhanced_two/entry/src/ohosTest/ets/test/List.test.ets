/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under * Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with * License.
 * You may obtain a copy of * License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under * License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See * License for * specific language governing permissions and
 * limitations under * License.
 */
import WebViewEnumAndSetWebController from './WebViewEnumAndSetWebController.test'
import webViewControllerPart3Test from './WebViewControllerPart3.test'
import WebViewControllerRestoreWebState from './WebViewControllerRestoreWebState.test'


export default function testsuite() {
   webViewControllerPart3Test()
   WebViewEnumAndSetWebController()
   WebViewControllerRestoreWebState()
}