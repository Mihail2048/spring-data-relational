package org.springframework.data.relational.core.query;

/**
 * Build-in {@link Comparator comparators} used by {@link Criteria}
 *
 * @author Mikhail Polivakha
 */
public class Comparators {

    public static final Comparator INITIAL = () -> "";
    public static final Comparator EQUALS = () -> "=";
    public static final Comparator NOT_EQUALS = () -> "!=";
    public static final Comparator BETWEEN = () -> "BETWEEN";
    public static final Comparator NOT_BETWEEN = () -> "NOT BETWEEN";
    public static final Comparator LESS_THAN = () -> "<";
    public static final Comparator LESS_THAN_OR_EQUALS = () -> "<=";
    public static final Comparator GREATER_THAN = () -> ">";
    public static final Comparator GREATER_THAN_OR_EQUALS = () -> ">=";
    public static final Comparator IS_NULL = () -> "IS NULL";
    public static final Comparator IS_NOT_NULL = () -> "IS NOT NULL";
    public static final Comparator LIKE = () -> "LIKE";
    public static final Comparator NOT_LIKE = () -> "NOT LIKE";
    public static final Comparator NOT_IN = () -> "NOT IN";
    public static final Comparator IN = () -> "IN";
    public static final Comparator IS_TRUE = () -> "IS TRUE";
    public static final Comparator IS_FALSE = () -> "IS FALSE";

}
