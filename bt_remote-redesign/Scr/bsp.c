#include "qpc.h"
#include "bsp.h"
#include "app_assert.h"
#include "sl_bluetooth.h"

Q_NORETURN Q_onError(char const * const module, int_t const id) {
    // NOTE: this implementation of the assertion handler is intended only
    // for debugging and MUST be changed for deployment of the application
    // (assuming that you ship your production code with assertions enabled).
    Q_UNUSED_PAR(module);
    Q_UNUSED_PAR(id);

#ifndef NDEBUG
    app_assert_s(false);
    // for debugging, hang on in an endless loop...
    for (;;) {
    }
#endif

    sl_bt_system_reset(0U);
}
