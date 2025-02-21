/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

export class Constants {
  static readonly USE_LOW_STRESS_TIMES = true
  static readonly LOW_STRESS_TIMES = 10
  static readonly DEFAULT_STRESS_TIMES = 2000
  static readonly PAGE_EVENT_KEY = 10
  static readonly WEB_ATTRIBUTE_ONDOWNLOADSTART_BUTTON_KEY = 'WebAttributeOnDownloadStartTestButton'
  static readonly WEB_ATTRIBUTE_ONERRORRECEIVE_BUTTON_KEY = 'WebAttributeOnErrorReceiveTestButton'
  static readonly WEB_ATTRIBUTE_ONFULLSCREENENTER_BUTTON_KEY = 'WebAttributeOnFullScreenEnterTestButton'
  static readonly WEB_ATTRIBUTE_ONFULLSCREENEXIT_BUTTON_KEY = 'WebAttributeOnFullScreenExitTestButton'
  static readonly WEB_ATTRIBUTE_ONHTTPERRORRECEIVE_BUTTON_KEY = 'WebAttributeOnHttpErrorReceiveTestButton'
  static readonly WEB_ATTRIBUTE_ONINTERCEPTREQUEST_BUTTON_KEY = 'WebAttributeOnInterceptRequestTestButton'
  static readonly WEB_ATTRIBUTE_ONLOADINTERCEPT_BUTTON_KEY = 'WebAttributeOnLoadInterceptTestButton'
  static readonly WEB_ATTRIBUTE_ONSCROLL_BUTTON_KEY = 'WebAttributeOnScrollTestButton'
  static readonly WEB_ATTRIBUTE_ONTITLERECEIVE_BUTTON_KEY = 'WebAttributeOnTitleReceiveTestButton'
  static readonly WEB_ATTRIBUTE_ONURLLOADINTERCEPT_BUTTON_KEY = 'WebAttributeOnUrlLoadInterceptTestButton'
  static readonly WEB_CONTROLLER_ACCESSBACKWARD_BUTTON_KEY = 'WebControllerAccessBackwardTestButton'
  static readonly WEB_CONTROLLER_ACCESSFORWARD_BUTTON_KEY = 'WebControllerAccessForwardTestButton'
  static readonly WEB_CONTROLLER_ACCESSSTEP_BUTTON_KEY = 'WebControllerAccessStepTestButton'
  static readonly WEB_CONTROLLER_BACKWARD_BUTTON_KEY = 'WebControllerBackwardTestButton'
  static readonly WEB_CONTROLLER_CLEARHISTORY_BUTTON_KEY = 'WebControllerClearHistoryTestButton'
  static readonly WEB_CONTROLLER_FORWARD_BUTTON_KEY = 'WebControllerForwardTestButton'
  static readonly WEB_CONTROLLER_REQUESTFOCUS_BUTTON_KEY = 'WebControllerRequestFocusTestButton'
  static readonly WEB_ON_PAGE_END_BUTTON_KEY = 'WebOnPageEndTestButton'
  static readonly WEB_VIEW_ONCE_BUTTON_KEY = 'WebViewOnceTestButton'
  static readonly WEB_VIEW_CONTROLLER_CUSTOMIZE_SCHEMES_BUTTON_KEY = 'WebViewControllerCustomizeSchemesTestButton'
  static readonly WEB_ON_FIRST_CONTENTFUL_PAINT_BUTTON_KEY = 'WebOnFirstContentfulPaintTestButton'
  static readonly WEB_ON_FAVICON_RECEIVED_BUTTON_KEY = 'WebOnFaviconReceivedTestButton'
  static readonly WEB_ON_AUDIO_STATE_CHANGED_BUTTON_KEY = 'WebOnAudioStateChangedTestButton'
  static readonly WEB_ON_SEARCH_RESULT_RECEIVE_BUTTON_KEY = 'WebOnSearchResultReceiveTestButton'
  static readonly WEB_ON_RENDER_EXITED_BUTTON_KEY = 'WebOnRenderExitedTestButton'
  static readonly WEB_ON_PAGE_BEGIN_BUTTON_KEY = 'WebOnPageBeginTestButton'
  static readonly WEB_ON_SCALE_CHANGE_BUTTON_KEY = 'WebOnScaleChangeTestButton'
  static readonly WEB_ON_REQUEST_SELECTED_BUTTON_KEY = 'WebOnRequestSelectedTestButton'
  static readonly WEB_ON_PROGRESS_CHANGE_BUTTON_KEY = 'WebOnProgressChangeTestButton'
  static readonly WEB_ON_INTERCEPT_KEY_EVENT_BUTTON_KEY = 'WebOnInterceptKeyEventTestButton'
  static readonly WEB_ON_REFRESH_ACCESSED_HISTORY_BUTTON_KEY = 'WebOnRefreshAccessedHistoryTestButton'
  static readonly WEB_ON_DATA_RESUBMITTED_BUTTON_KEY = 'WebOnDataResubmittedTestButton'
  static readonly WEB_ON_BEFORE_UNLOAD_BUTTON_KEY = 'WebOnBeforeUnloadTestButton'
  static readonly WEB_ON_GEOLOCATION_SHOW_BUTTON_KEY = 'WebOnGeolocationShowTestButton'
  static readonly WEB_JS_GEOLOCATION_INVOKE_BUTTON_KEY = 'WebJsGeolocationInvokeTestButton'
  static readonly WEB_FULL_SCREEN_EXIT_HANDLER_EXIT_FULL_SCREEN_BUTTON_KEY =
    'WebFullScreenExitHandlerExitFullScreenTestButton'
  static readonly WEB_DATA_RESUBMISSION_HANDLER_RESEND_BUTTON_KEY = 'WebDataResubmissionHandlerResendTestButton'
  static readonly WEB_DATA_RESUBMISSION_HANDLER_CANCEL_BUTTON_KEY = 'WebDataResubmissionHandlerCancelTestButton'
  static readonly WEB_VIEW_CONTROLLER_DOWNLOAD_BUTTON_KEY = 'WebViewControllerDownloadTestButton'
  static readonly WEB_RESOURCE_ERROR_GETERRORCODE_BUTTON_KEY = 'WebResourceErrorGetErrorCodeTestButton'
  static readonly WEB_RESOURCE_ERROR_GETERRORINFO_BUTTON_KEY = 'WebResourceErrorGetErrorInfoTestButton'
  static readonly WEB_VIEW_CONTROLLER_ACCESSBACKWARD_BUTTON_KEY = 'WebViewControllerAccessBackwardTestButton'
  static readonly WEB_VIEW_CONTROLLER_ACCESSFORWARD_BUTTON_KEY = 'WebViewControllerAccessForwardTestButton'
  static readonly WEB_VIEW_CONTROLLER_ACCESSSTEP_BUTTON_KEY = 'WebViewControllerAccessStepTestButton'
  static readonly WEB_VIEW_CONTROLLER_BACKORFORWARD_BUTTON_KEY = 'WebViewControllerBackOrForwardTestButton'
  static readonly WEB_VIEW_CONTROLLER_BACKWARD_BUTTON_KEY = 'WebViewControllerBackwardTestButton'
  static readonly WEB_VIEW_CONTROLLER_CLEARCLIENTAUTHENTICATIONCACHE_BUTTON_KEY
    = 'WebViewControllerClearClientAuthenticationCacheTestButton'
  static readonly WEB_VIEW_CONTROLLER_CLEARHISTORY_BUTTON_KEY = 'WebViewControllerClearHistoryTestButton'
  static readonly WEB_VIEW_CONTROLLER_CLEARMATCHES_BUTTON_KEY = 'WebViewControllerClearMatchesTestButton'
  static readonly WEB_VIEW_CONTROLLER_FORWARD_BUTTON_KEY = 'WebViewControllerForwardTestButton'
  static readonly WEB_VIEW_CONTROLLER_GETORIGINALURL_BUTTON_KEY = 'WebViewControllerGetOriginalUrlTestButton'
  static readonly WEB_VIEW_CONTROLLER_GETURL_BUTTON_KEY = 'WebViewControllerGetUrlTestButton'
  static readonly WEB_VIEW_CONTROLLER_HASIMAGE_BUTTON_KEY = 'WebViewControllerHasImageTestButton'
  static readonly WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY = 'WebViewControllerLoadUrlTestButton'
  static readonly WEB_VIEW_CONTROLLER_PREFETCHPAGE_BUTTON_KEY = 'WebViewControllerPrefetchPageTestButton'
  static readonly WEB_VIEW_CONTROLLER_REQUESTFOCUS_BUTTON_KEY = 'WebViewControllerRequestFocusTestButton'
  static readonly WEB_VIEW_CONTROLLER_RESTOREWEBSTATE_BUTTON_KEY = 'WebViewControllerRestoreWebStateTestButton'
  static readonly WEB_VIEW_CONTROLLER_SCROLLBY_BUTTON_KEY = 'WebViewControllerScrollByTestButton'
  static readonly WEB_VIEW_CONTROLLER_SCROLLTO_BUTTON_KEY = 'WebViewControllerScrollToTestButton'
  static readonly WEB_VIEW_CONTROLLER_SERIALIZEWEBSTATE_BUTTON_KEY = 'WebViewControllerSerializeWebStateTestButton'
  static readonly WEB_VIEW_CONTROLLER_SETAUDIOMUTED_KEY = 'WebViewControllerSetAudioMutedTestButton'
  static readonly WEB_VIEW_CONTROLLER_SLIDESCROLL_BUTTON_KEY = 'WebViewControllerSlideScrollTestButton'
  static readonly WEB_LOAD_DATA_BUTTON_KEY = 'WebLoadDataTestButton'
  static readonly WEB_LOAD_URL_BUTTON_KEY = 'WebLoadUrlTestButton'
  static readonly WEB_REFRESH_BUTTON_KEY = 'WebRefreshTestButton'
  static readonly WEB_GET_HIT_TEST_BUTTON_KEY = 'WebGetHitTestTestButton'
  static readonly WEB_ZOOM_BUTTON_KEY = 'WebZoomTestButton'
  static readonly WEB_ON_ACTIVE_BUTTON_KEY = 'WebOnActiveTestButton'
  static readonly WEB_ON_INACTIVE_BUTTON_KEY = 'WebOnInactiveTestButton'
  static readonly WEB_REGISTER_JAVASCRIPT_PROXY_BUTTON_KEY = 'WebRegisterJavaScriptProxyTestButton'
  static readonly WEB_DELETE_JAVASCRIPT_REGISTER_BUTTON_KEY = 'WebDeleteJavaScriptRegisterTestButton'
  static readonly WEB_GET_COOKIE_MANAGER_BUTTON_KEY = 'WebGetCookieManagerTestButton'
  static readonly WEB_STOP_BUTTON_KEY = 'WebStopTestButton'
  static readonly WEB_VIEW_CONTROLLER_LOAD_DATA_BUTTON_KEY = 'WebViewControllerLoadDataTestButton'
  static readonly WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY = 'WebViewControllerRefreshTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_BUTTON_KEY = 'WebViewControllerZoomTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_IN_BUTTON_KEY = 'WebViewControllerZoomInTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_OUT_BUTTON_KEY = 'WebViewControllerZoomOutTestButton'
}
