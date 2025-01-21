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
import webViewControllerJsunit from './webViewControllerJsunit.test'
import webViewOnWindowNewJsunit from './WebViewOnWindowNewJsunit.test'
import webViewOnErrorReceive02Jsunit from './WebViewOnErrorReceive02Jsunit.test'
import webViewOnErrorReceive03Jsunit from './WebViewOnErrorReceive03Jsunit.test'
import webViewHasImageJsunit from './webViewHasImageJsunit.test'
import webViewSrollableJsunit from './webViewSrollableJsunit.test'
import webViewSetPrintBackgroundJsunit from './webViewSetPrintBackgroundJsunit.test'
import webViewSrollToJsunit from './webViewSrollToJsunit.test'
import webViewSrollByJsunit from './webViewSrollByJsunit.test'
import WebViewWebStorageJsunit from './WebViewWebStorageJsunit.test'
import runJavaScript from './runJavaScript.test'
import storeWebArchive from './storeWebArchive.test'
import storeWebArchiveSaveFail from './storeWebArchiveSaveFail.test'
import webViewOnBeforeUnload from './webViewOnBeforeUnload.test'
import webViewOnInterceptReqOne from './webViewOnInterceptReqOne.test'
import webViewOnInterceptReqTwo from './webViewOnInterceptReqTwo.test'
import webViewOnInterceptReqThree from './webViewOnInterceptReqThree.test'
import webViewOnScroll from './webViewOnScroll.test'
import webViewOnSslError from './webViewOnSslError.test'
import webViewOnFirstCont from './webViewOnFirstCont.test'
import webViewOnFirstContTwo from './webViewOnFirstContTwo.test'
import webViewOnFirstContThree from './webViewOnFirstContThree.test'
import webViewOnFirstContFour from './webViewOnFirstContFour.test'
import webViewDefaultFontSizeWithMinLogical from './webViewDefaultFontSizeWithMinLogical.test'
import webViewDefaultFontSize from './webViewDefaultFontSize.test'
import webViewDefaultFontSizeNoMinFontSize from './webViewDefaultFontSizeNoMinFontSize.test'
import webViewDefaultFontSizeNoAll from './webViewDefaultFontSizeNoAll.test'
import webViewOnFullScreenEnter from './webViewOnFullScreenEnter.test'
import webViewOnFullScreenExit from './webViewOnFullScreenExit.test'
import webViewExistCookie from './webViewExistCookie.test'
import webViewDeleteEntireCookie from './webViewDeleteEntireCookie.test'
import webViewInVokeFalse from './webViewInVokeFalse.test'
import webViewInVoke from './webViewInVoke.test'
import webViewSetHttpDns from './webViewSetHttpDns.test'
import webViewONHttpErrorReceive from './webViewONHttpErrorReceive.test'
import webViewONHttpErrorReceiveExample from './webViewONHttpErrorReceiveExample.test'
import webViewONHttpErrorRecvExampleIsReady from './webViewONHttpErrorRecvExampleIsReady.test'
import webViewONHttpErrorReceiveIframe from './webViewONHttpErrorReceiveIframe.test'
import webViewONHttpErrorReceiveString from './webViewONHttpErrorReceiveString.test'
import webViewONHttpErrorReceiveNumber from './webViewONHttpErrorReceiveNumber.test'
import webViewGetCertificate from './webViewGetCertificate.test'
import webViewSetAudioMuted from './webViewSetAudioMuted.test'
import webViewGetAccessibleGeolocation from './webViewGetAccessibleGeolocation.test'
import webViewOnAudioStateChanged from './webViewOnAudioStateChanged.test'
import webViewMediaOption from './webViewMediaOption.test'
export default function testsuite() {
       webViewControllerJsunit()
       webViewOnErrorReceive02Jsunit()
       webViewHasImageJsunit()
       webViewSetPrintBackgroundJsunit()
       webViewSrollToJsunit()
       webViewSrollByJsunit()
       webViewSrollableJsunit()
       WebViewWebStorageJsunit()
       runJavaScript()
       storeWebArchive()
       storeWebArchiveSaveFail()
       //webViewOnBeforeUnload()
	   webViewSetHttpDns()
       webViewOnInterceptReqOne()
       webViewOnInterceptReqTwo()
       webViewOnInterceptReqThree()
       webViewOnScroll()
       webViewOnSslError()
       webViewOnFirstCont()
       webViewOnFirstContTwo()
       webViewOnFirstContThree()
       webViewOnFirstContFour()
       webViewDefaultFontSizeWithMinLogical()
       webViewDefaultFontSize()
       webViewDefaultFontSizeNoMinFontSize()
       webViewDefaultFontSizeNoAll()
       //webViewOnFullScreenEnter()
       //webViewOnFullScreenExit()
       webViewExistCookie()
       webViewDeleteEntireCookie()
       webViewInVokeFalse()
       webViewInVoke()
       webViewONHttpErrorReceive()
       webViewONHttpErrorReceiveExample()
       webViewONHttpErrorRecvExampleIsReady()
       webViewONHttpErrorReceiveIframe()
       webViewONHttpErrorReceiveString()
       webViewONHttpErrorReceiveNumber()
       webViewGetCertificate()
       webViewSetAudioMuted()
       webViewGetAccessibleGeolocation()
       //webViewOnAudioStateChanged()
       //webViewMediaOption()
       webViewOnWindowNewJsunit()
       webViewOnErrorReceive03Jsunit()
}