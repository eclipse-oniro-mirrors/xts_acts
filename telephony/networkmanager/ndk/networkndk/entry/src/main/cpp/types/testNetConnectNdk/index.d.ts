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

export const OHNetConnGetAddrInfo: (a: string, b: string, c: number) => number;
export const OHNetConnFreeDnsResult: (a: number) => number;
export const OHNetConnGetAllNets: (a: number) => number;
export const OHNetConnHasDefaultNet: (a: number) => number;
export const OHNetConnIsDefaultNetMetered: (a: number) => number;
export const OHNetConnGetDefaultNet: (a: number) => number;
export const OHNetConnGetConnectionProperties: (a: number) => number;
export const OHNetConnGetNetCapabilities: (a: number) => number;
export const OHNetConnGetDefaultHttpProxy: (a: number) => number;
export const OHOSNetConnRegisterDnsResolver: (a: number) => number;
export const OHOSNetConnUnregisterDnsResolver: (a: number) => number;
export const OHNetConnRegisterDnsResolver: (a: number) => number;
export const OHNetConnUnregisterDnsResolver: (a: number) => number;
export const OHNetConnBindSocket: (a: number) => number;
export const OHNetConnSetAppHttpProxy: (a: number) => number;
export const OHNetConnRegisterAppHttpProxyCallback: (a: number) => number;
export const OHNetConnUnregisterAppHttpProxyCallback: (a: number) => number;
export const OHNetConnRegisterNetConnCallback: (a: number) => number;
export const OHNetConnRegisterNetConnCallbackTimeout: (a: number) => number;
export const OHNetConnRegisterDefaultNetConnCallback: (a: number) => number;
export const OHNetConnUnregisterNetConnCallback: (a: number) => number;
export const OHNetConnGetPacUrl: (a: number) => string;
export const OHNetConnSetPacUrl: (a: string) => number;