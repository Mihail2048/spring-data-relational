package org.springframework.data.relational.core.query;

import org.springframework.data.relational.core.query.Criteria.CriteriaStep;

/**
 * Common interface for various Comparators, both build-ins and provided externally (custom).
 *
 * @author Mikhail Polivakha
 */
public interface Comparator {

    /**
     * Returns the actual condition to be used in the constructed SQL query.
     * For the custom comparators this method is supposed to return the fully
     * constructed condition including possible operands.
     *
     * @see CriteriaStep#custom(CustomComparator)
     * @see Comparators Build-in Comparators
     */
    String getComparator();
}
