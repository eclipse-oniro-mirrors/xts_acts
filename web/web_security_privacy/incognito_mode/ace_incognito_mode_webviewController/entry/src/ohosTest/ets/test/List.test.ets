/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import webViewGetAccessibleGeolocation from './webViewGetAccessibleGeolocation.test'
import GeolocationPermissionsAllowGeolocation from './GeolocationPermissionsAllowGeolocation.test'

import GeolocationPermissionsDeleteGeolocation from './GeolocationPermissionsDeleteGeolocation.test'
import GeolocationPermissionsDeleteAllGeolocation from './GeolocationPermissionsDeleteAllGeolocation.test'

import GeolocationPermissionsGetAccessibleGeolocation from './GeolocationPermissionsGetAccessibleGeolocation.test'
import GeolocationPermissionsGetAccessibleGeolocationCallback from './GeolocationPermissionsGetAccessibleGeolocationCallback.test'

export default function testsuite() {
        webViewGetAccessibleGeolocation()
        GeolocationPermissionsAllowGeolocation()
        GeolocationPermissionsDeleteGeolocation()
        GeolocationPermissionsDeleteAllGeolocation()
        GeolocationPermissionsGetAccessibleGeolocation()
        GeolocationPermissionsGetAccessibleGeolocationCallback()
}