/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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


import geolocationTest_geo5 from './GeocoderMTest.test.js'
import geolocationTest_geo1 from './GeocoderTest.test.js'
import geolocationTest_4 from './GetCountryCode.test.js'
import geolocationTest_6 from './GetCountryCodeM.test.js'
import geolocationTest_geo3 from './LocationTest.test.js'
import geolocationTest_geo7 from './LocationMTest.test.js'
import geolocationTest_geo2 from './SystemLocation.test.js'
export default function testsuite() {
   geolocationTest_geo5()
   geolocationTest_geo1()
   geolocationTest_4()
   geolocationTest_6()
   geolocationTest_geo3()
   geolocationTest_geo7()
   geolocationTest_geo2()
}
