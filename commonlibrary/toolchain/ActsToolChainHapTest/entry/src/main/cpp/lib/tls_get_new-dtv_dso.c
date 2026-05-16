/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

__thread char v[123];
__thread int x = 42;
__thread long double y;
enum { TLS_BYTE_MOD = 16 };

void* f()
{
    int i;
    for (i = 0; i < sizeof v; i++)
        v[i] = i % TLS_BYTE_MOD;
    return v;
}
void* g()
{
    return &x;
}
void* h()
{
    return &y;
}
