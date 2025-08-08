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
import webViewContMessageError from './webViewContMessageError.test'
import webViewContPageOperationsError from './webViewContPageOperationsError.test'
import webViewContJavaScriptError from './webViewContJavaScriptError.test'
import webViewContZoomAndOthersError from './webViewContZoomAndOthersError.test'
import webViewContStoreWebArchiveError from './webViewContStoreWebArchiveError.test'
import webViewContGetUrlAndOthersError from './webViewContGetUrlAndOthersError.test'
import webViewContCookieToGeoLocationError from './webViewContCookieToGeoLocationError.test'
import webViewContJsMessageExtReturnError from './webViewContJsMessageExtReturnError.test'
import webViewContWebMessageExtReturnError from './webViewContWebMessageExtReturnError.test'
import webViewContPageAndprepareForPageLoadErrorOne from './webViewContPageAndprepareForPageLoadErrorOne.test'
import webViewContPageAndprepareForPageLoadErrorTwo from './webViewContPageAndprepareForPageLoadErrorTwo.test'
import webViewContCreatePdfAndOthersError from './webViewContCreatePdfAndOthersError.test'

export default function testsuite() {
  webViewContMessageError()
  webViewContPageOperationsError()
  webViewContJavaScriptError()
  webViewContZoomAndOthersError()
  webViewContStoreWebArchiveError()
  webViewContGetUrlAndOthersError()
  webViewContCookieToGeoLocationError()
  webViewContJsMessageExtReturnError()
  webViewContWebMessageExtReturnError()
  //webViewContPageAndprepareForPageLoadErrorOne()
  //webViewContPageAndprepareForPageLoadErrorTwo()
  webViewContCreatePdfAndOthersError()

}