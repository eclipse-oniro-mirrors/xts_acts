/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import webCookieManagerFetchCookieSyncOne from './WebCookieManagerFetchCookieSyncOne.test'
import webCookieManagerFetchCookieSyncTwo from './WebCookieManagerFetchCookieSyncTwo.test'
import webCookieManagerFetchCookieOne from './WebCookieManagerFetchCookieOne.test'
import webCookieManagerFetchCookieTwo from './WebCookieManagerFetchCookieTwo.test'
import webCookieManagerFetchCookieThree from './WebCookieManagerFetchCookieThree.test'
import webCookieManagerExistCookie from './WebCookieManagerExistCookie.test'
import webCookieManagerFetchCookieIncognito from './WebCookieManagerFetchCookieIncognito.test'
import webCookieManagerConfigCookie from './WebCookieManagerConfigCookie.test'


export default function testsuite() {
  webCookieManagerFetchCookieSyncOne()
  webCookieManagerFetchCookieSyncTwo()
  webCookieManagerFetchCookieOne()
  webCookieManagerFetchCookieTwo()
  webCookieManagerFetchCookieThree()
  webCookieManagerExistCookie()
  webCookieManagerFetchCookieIncognito()
  webCookieManagerConfigCookie()
}