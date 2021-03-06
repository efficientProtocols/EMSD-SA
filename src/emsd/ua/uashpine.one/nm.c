/*
 * 
 * Copyright (C) 1997-2002  Neda Communications, Inc.
 * 
 * This file is part of Neda-EMSD. An implementation of RFC-2524.
 * 
 * Neda-EMSD is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License (GPL) as 
 * published by the Free Software Foundation; either version 2,
 * or (at your option) any later version.
 * 
 * Neda-EMSD is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with Neda-EMSD; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.  
 * 
 */

/*
 *  
 *  Available Other Licenses -- Usage Of This Software In Non Free Environments:
 * 
 *  License for uses of this software with GPL-incompatible software
 *  (e.g., proprietary, non Free) can be obtained from Neda Communications, Inc.
 *  Visit http://www.neda.com/ for more information.
 * 
 */

/*+
 * File name: nm.c
 *
 * Description: Network Management functions.
 *
 * Functions:
 *   NM_incCounter(int layer, register Counter *counter, int increment)
 *   NM_repEvent(int layer, int eventid)
 *
-*/

/*
 * 
 * History:
 *
 */

#ifdef RCS_VER	/*{*/
static char rcs[] = "$Id: nm.c,v 1.2 2002/10/25 07:46:39 mohsen Exp $";
#endif /*}*/

#include "estd.h"  /* or local.h? */
#include "nm.h"

extern SuccFail NM_repEvent(int layer, int eventid);


/*<
 * Function:    NM_incCounter
 *
 * Description: Add the input argument "increment" to a counter.
 *              If a threshold is specified and the counter value exceeds
 *              that value, generate an network management event.
 *
 * Arguments:   Layer, pointer to counter, increment value.
 *
 * Returns:     0 on successful execution, -1 on unsuccessful completion.
 * 
>*/

SuccFail 
NM_incCounter(int layer, register Counter *counter, int increment)
{
    counter->count += increment;
    if (counter->threshold && counter->count >= counter->threshold->count) {
	counter->count = 0;
	return NM_repEvent(layer, counter->event);
    }
    return (SUCCESS);
}


/*<
 * Function:    NM_repEvent
 *
 * Description: Process an event.
 *
 * Arguments:   Layer, event ID.
 *
 * Returns:     0 on successful execution, other than 0 on unsuccessful.
 * 
>*/

SuccFail
NM_repEvent(int layer, int eventid)
{
    /* NOTYET */
    return (SUCCESS);
}
