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
  static readonly LOW_STRESS_TIMES = 20
  static readonly DEFAULT_STRESS_TIMES = 2000
  static readonly PAGE_EVENT_KEY = 10
  static readonly WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY = 'WebViewControllerLoadUrlTestButton'
  static readonly WEB_VIEW_CONTROLLER_LOAD_DATA_BUTTON_KEY = 'WebViewControllerLoadDataTestButton'
  static readonly WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY = 'WebViewControllerRefreshTestButton'
  static readonly WEB_ON_PAGE_END_BUTTON_KEY = 'WebOnPageEndTestButton'
  static readonly WEB_VIEW_ONCE_BUTTON_KEY = 'WebViewOnceTestButton'
  static readonly WEB_VIEW_CONTROLLER_CUSTOMIZE_SCHEMES_BUTTON_KEY = 'WebViewControllerCustomizeSchemesTestButton'
  static readonly WEB_ON_FIRST_CONTENTFUL_PAINT_BUTTON_KEY = 'WebOnFirstContentfulPaintTestButton'
  static readonly WEB_ON_FAVICON_RECEIVED_BUTTON_KEY = 'WebOnFaviconReceivedTestButton'
  static readonly WEB_ON_AUDIO_STATE_CHANGED_BUTTON_KEY = 'WebOnAudioStateChangedTestButton'
  static readonly WEB_ON_SEARCH_RESULT_RECEIVE_BUTTON_KEY = 'WebOnSearchResultReceiveTestButton'
  static readonly WEB_ON_ALERT_BUTTON_KEY = 'WebOnAlertTestButton'
  static readonly WEB_VIEW_CONTROLLER_CLEAR_SSL_CACHE_BUTTON_KEY = 'WebViewControllerClearSslCacheTestButton'
  static readonly WEB_VIEW_CONTROLLER_GET_CERTIFICATE_BUTTON_KEY = 'WebViewControllerGetCertificateTestButton'
  static readonly WEB_VIEW_CONTROLLER_GET_HIT_TEST_BUTTON_KEY = 'WebViewControllerGetHitTestTestButton'
  static readonly WEB_VIEW_CONTROLLER_GET_HIT_TEST_VALUE_BUTTON_KEY = 'WebViewControllerGetHitTestValueTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_BUTTON_KEY = 'WebViewControllerZoomTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_IN_BUTTON_KEY = 'WebViewControllerZoomInTestButton'
  static readonly WEB_VIEW_CONTROLLER_ZOOM_OUT_BUTTON_KEY = 'WebViewControllerZoomOutTestButton'
  static readonly WEB_REFRESH_BUTTON_KEY = 'WebRefreshTestButton'
  static readonly WEB_GET_HIT_TEST_BUTTON_KEY = 'WebGetHitTestTestButton'
  static readonly WEB_ZOOM_BUTTON_KEY = 'WebZoomTestButton'
  static readonly WEB_LOAD_DATA_BUTTON_KEY = 'WebLoadDataTestButton'
  static readonly WEB_LOAD_URL_BUTTON_KEY = 'WebLoadUrlTestButton'
  static readonly WEB_ON_CONFIRM_BUTTON_KEY = 'WebOnConfirmTestButton'
  static readonly WEB_ON_CONSOLE_BUTTON_KEY = 'WebOnConsoleTestButton'
  static readonly WEB_ON_PROMPT_BUTTON_KEY = 'WebOnPromptTestButton'
  static readonly WEB_COOKIE_SAVE_COOKIE_BUTTON_KEY = 'WebCookieSaveCookieTestButton'
  static readonly WEB_COOKIE_SET_COOKIE_BUTTON_KEY = 'WebCookieSetCookieTestButton'
  static readonly WEB_COOKIE_MANAGER_GET_COOKIE_BUTTON_KEY = 'WebCookieManagerGetCookieTestButton'
  static readonly WEB_COOKIE_MANAGER_SET_COOKIE_BUTTON_KEY = 'WebCookieManagerSetCookieTestButton'
  static readonly WEB_COOKIE_MANAGER_IS_COOKIE_ALLOWED_BUTTON_KEY = 'WebCookieManagerIsCookieAllowedTestButton'
  static readonly WEB_COOKIE_MANAGER_SAVE_COOKIE_ASYNC_BUTTON_KEY = 'WebCookieManagerSaveCookieAsyncTestButton'
  static readonly WEB_ON_ACTIVE_BUTTON_KEY = 'WebOnActiveButton'
  static readonly WEB_ON_INACTIVE_BUTTON_KEY = 'WebOnInactiveTestButton'
  static readonly WEB_DELETE_JAVASCRIPT_REGISTER_BUTTON_KEY = 'WebDeleteJavaScriptRegisterTestButton'
  static readonly WEB_REGISTER_JAVASCRIPT_PROXY_BUTTON_KEY = 'WebRegisterJavaScriptProxyTestButton'
  static readonly WEB_VIEW_CONTROLLER_DELETE_JAVASCRIPT_REGISTER_BUTTON_KEY =
    'WebViewControllerDeleteJavaScriptRegisterTestButton'
  static readonly WEB_VIEW_CONTROLLER_REGISTER_JAVASCRIPT_PROXY_BUTTON_KEY =
    'WebViewControllerRegisterJavaScriptProxyTestButton'
  static readonly WEB_ON_SSL_ERROR_EVENT_RECEIVE_BUTTON_KEY = 'WebOnSslErrorEventReceiveTestButton'
  static readonly WEB_GET_LINE_NUMBER_BUTTON_KEY = 'WebGetLineNumberTestButton'
  static readonly WEB_GET_MESSAGE_BUTTON_KEY = 'WebGetMessageTestButton'
  static readonly WEB_GET_MESSAGE_LEVEL_BUTTON_KEY = 'WebGetMessageLevelTestButton'
  static readonly WEB_GET_SOURCE_ID_BUTTON_KEY = 'WebGetSourceIdTestButton'
  static readonly WEB_JSRESULT_HANDLE_CANCEL_BUTTON_KEY = 'WebJsResultHandleCancelTestButton'
  static readonly WEB_JSRESULT_HANDLE_CONFIRM_BUTTON_KEY = 'WebJsResultHandleConfirmTestButton'
  static readonly WEB_JSRESULT_HANDLE_PROMPT_CONFIRM_BUTTON_KEY = 'WebJsResultHandlePromptConfirmTestButton'
  static readonly WEB_SSL_ERROR_HANDLER_HANDLE_CANCEL_BUTTON_KEY = 'WebSslErrorHandlerHandleCancelTestButton'
  static readonly WEB_SSL_ERROR_HANDLER_HANDLE_CONFIRM_BUTTON_KEY = 'WebSslErrorHandlerHandleConfirmTestButton'
  static readonly WEB_GET_COOKIE_MANAGER_BUTTON_KEY = 'WebGetCookieManagerTestButton'
  static readonly WEB_VIEW_CONTROLLER_ONACTIVE_BUTTON_KEY = 'WebViewControllerOnActiveTestButton'
  static readonly WEB_VIEW_CONTROLLER_ONINACTIVE_BUTTON_KEY = 'WebViewControllerOnInactiveTestButton'
  static readonly WEB_VIEW_CONTROLLER_STOP_BUTTON_KEY = 'WebViewControllerStopTestButton'
  static readonly WEB_STOP_BUTTON_KEY = 'WebStopTestButton'
  static readonly WEB_VIEW_CONTROLLER_STORE_WEBARCHIVE_BUTTON_KEY = 'WebViewControllerStoreWebArchiveTestButton'
  static readonly WEB_HTTP_AUTH_HANDLER_CANCEL_BUTTON_KEY = 'WebHttpAuthHandlerCancelTestButton'
  static readonly WEB_HTTP_AUTH_HANDLER_CONFIRM_BUTTON_KEY = 'WebHttpAuthHandlerConfirmTestButton'
  static readonly WEB_HTTP_AUTH_HANDLER_ISHTTPAUTHINFOSAVED_BUTTON_KEY =
    'WebHttpAuthHandlerIsHttpAuthInfoSavedTestButton'
  static readonly WEB_ON_HTTP_AUTH_REQUEST_BUTTON_KEY = 'WebOnHttpAuthRequestTestButton'
  static readonly WEB_RUN_JAVASCRIPT_BUTTON_KEY = 'WebRunJavaScriptTestButton'
  static readonly WEB_VIEW_CONTROLLER_RUN_JAVASCRIPT_BUTTON_KEY = 'WebViewControllerRunJavaScriptTestButton'
  static readonly WEB_VIEW_CONTROLLER_RUN_JAVASCRIPT_EXT_BUTTON_KEY =
    'WebViewControllerRunJavaScriptExtTestTestButton'
  static readonly WEB_VIEW_CONTROLLER_REMOVE_CACHE_BUTTON_KEY = 'WebViewControllerRemoveCacheTestButton'
  static readonly WEB_VIEW_CONTROLLER_SET_HTTP_DNS_BUTTON_KEY = 'WebViewControllerSetHttpDnsTestButton'
  static readonly WEB_VIEW_CONTROLLER_SET_WEB_DEBUGGING_ACCESS_BUTTON_KEY =
    'WebViewControllerSetWebDebuggingAccessTestButton'
  static readonly WEB_VIEW_CONTROLLER_PAGE_DOWN_BUTTON_KEY = 'WebViewControllerPageDownTestButton'
  static readonly WEB_VIEW_CONTROLLER_PAGE_UP_BUTTON_KEY = 'WebViewControllerPageUpTestButton'
  static readonly WEB_VIEW_CONTROLLER_INITIALIZE_WEB_ENGINE_BUTTON_KEY =
    'WebViewControllerInitializeWebEngineTestButton'
  static readonly WEB_COOKIE_MANAGER_DELETE_ENTIRE_COOKIE_BUTTON_KEY =
    'WebCookieManagerDeleteEntireCookieTestTestButton'
  static readonly WEB_COOKIE_MANAGER_DELETE_SESSION_COOKIE_BUTTON_KEY =
    'WebCookieManagerDeleteSessionCookieTestButton'
  static readonly WEB_COOKIE_MANAGER_EXIST_COOKIE_BUTTON_KEY = 'WebCookieManagerExistCookieTestButton'
  static readonly WEB_COOKIE_MANAGER_IS_THIRD_PARTY_COOKIE_ALLOWED_BUTTON_KEY =
    'WebCookieManagerIsThirdPartyCookieAllowedTestButton'
  static readonly WEB_COOKIE_MANAGER_PUT_ACCEPT_COOKIE_ENABLED_BUTTON_KEY =
    'WebCookieManagerPutAcceptCookieEnabledTestButton'
  static readonly WEB_COOKIE_MANAGER_PUT_ACCEPT_THIRD_PARTY_COOKIE_ENABLED_BUTTON_KEY =
    'WebCookieManagerPutAcceptThirdPartyCookieEnabledTestButton'
  static readonly WEB_VIEW_CONTROLLER_GET_BACK_FORWARD_ENTRIES_BUTTON_KEY =
    'WebViewControllerGetBackForwardEntriesTestButton'
  static readonly WEB_VIEW_CONTROLLER_GET_FAVICON_BUTTON_KEY = 'WebViewControllerGetFaviconTestButton'
  static readonly FOR_PAGE_LOAD_ERROR = 'WebPrepareForPageLoadButton'
  static readonly WEB_CONTEXT_MENU_BUTTON_KEY = 'WebContextMenuButton'
  static readonly WEB_ATTRIBUTE_BUTTON_KEY = 'WebAttributeButton'
  static readonly WEB_PERMISSIONREQUEST_BUTTON_KEY = 'WebPermissionRequestButton'
  static readonly WEB_VIEW_CONTROLLER_BUTTON_KEY = 'WebViewControllerButton'
  static readonly SCREEN_CAPTURE_HANDLER_BUTTON_KEY = 'WebScreenCaptureHandler'
}
