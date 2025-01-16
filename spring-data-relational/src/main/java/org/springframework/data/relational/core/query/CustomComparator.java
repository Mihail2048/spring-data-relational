package org.springframework.data.relational.core.query;

/**
 * The {@link Comparator} that is meant for the end-user usage. Should be used, when the
 * condition on the particular column uses some vendor-specific API.
 *
 * @author Mikhail Polivakha
 */
public interface CustomComparator extends Comparator {

    /**
     * For the custom comparators this method is supposed to return the fully
     * constructed condition including possible operands.
     * <p>
     * <strong>Note: It is absolutely important to make sure that the value, returned from this method
     * is not vulnerable to SQL injection</strong>.
     *
     * @see Criteria.CriteriaStep#custom(CustomComparator)
     */
    @Override
    String getComparator();
}
