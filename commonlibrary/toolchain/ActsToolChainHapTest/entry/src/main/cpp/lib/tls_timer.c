/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

__thread char      g_c1 = 1;
__thread char      g_xchar = 2;
__thread char      g_c2 = 3;
__thread short     g_xshort = 4;
__thread char      g_c3 = 5;
__thread int       g_xint = 6;
__thread char      g_c4 = 7;
__thread long long g_xllong = 8;

struct {
    char *name;
    unsigned size;
    unsigned align;
    unsigned long addr;
} g_t[4];

#define entry(i, x) \
    g_t[i].name = #x; \
    g_t[i].size = sizeof (x); \
    g_t[i].align = __alignof__(x); \
    g_t[i].addr = (unsigned long)&(x)

__attribute__((constructor)) static void Init(void)
{
    entry(0, g_xchar);
    entry(1, g_xshort);
    entry(2, g_xint);
    entry(3, g_xllong);
}